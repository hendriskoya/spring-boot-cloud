#!/bin/bash

TIMEOUT=15
expected_http_code=200

WAITFORIT_QUIET=0

echoerr() { if [[ $WAITFORIT_QUIET -ne 1 ]]; then echo "$@" 1>&2; fi }

usage() {

    exit 1
}

wait_for()
{
    RESULT=0
    EXIT_CODE=99
    len=${#URLS[@]}

    for (( i=0; i<$len; i++ )); do
        URL=${URLS[$i]}
        echo "Testing $URL"

        num=1
        while [ $num -le $TIMEOUT ]
        do
            echo "Attempt $num"

            returned_http_code=$(curl -LI $URL -o /dev/null -w '%{http_code}' -s)
            
            if [ $returned_http_code == $expected_http_code ]
            then
                RESULT=$(( $RESULT +1 ))
                break;
            fi

            num=$(( $num + 1 ))
            sleep 1
        done
    done
    if [[ $RESULT == $len ]]
    then
        EXIT_CODE=0
    else
        EXIT_CODE=1
    fi
}

# process arguments
while [[ $# -gt 0 ]]
do
    case "$1" in
        -h)
        URLS=(${2//;/ })
        echo "URLS: ${#URLS[@]}"
        echo "URLS: $URLS"
        if [[ "${#URLS[@]}" == "1" ]]; then URLS=("$URLS"); fi
        # URLS=("$URLS")
        URL=${URLS[0]}
        shift 2
        ;;
        -t)
        TIMEOUT="$2"
        shift 2
        ;;
        --)
        shift
        COMMAND=("$@")
        break
        ;;
        *)
        echoerr "Unknown argument: $1"
        usage
        ;;
    esac
done

echo "URL: $URL"
echo "TIMEOUT: $TIMEOUT"
echo "COMMANDO: ${COMMAND[@]}"

if [[ "$URL" == "" ]]; then
    echoerr "Error: you need to provide a url with health check endpoint."
    usage
fi

wait_for

if [[ "$COMMAND" != "" ]]; then
    if [[ $EXIT_CODE -ne 0 ]]; then
        exit $EXIT_CODE
    fi
    exec "${COMMAND[@]}"
else
    exit $EXIT_CODE
fi