FROM openjdk:11.0.6-jre

WORKDIR /opt/

COPY build/distributions/consumer-boot-*.zip .

RUN unzip consumer-boot-*.zip && \
    rm -rf consumer-boot-*.zip && \
    mv consumer-boot-* consumer

COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

CMD ["/bin/bash","consumer/bin/consumer"]