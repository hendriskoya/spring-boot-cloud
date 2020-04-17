FROM openjdk:11.0.6-jre

ENV TZ=America/Sao_Paulo

WORKDIR /opt/

RUN echo $TZ > /etc/timezone

COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

COPY build/distributions/consumer-boot-*.zip .

RUN unzip consumer-boot-*.zip && \
    rm -rf consumer-boot-*.zip && \
    mv consumer-boot-* consumer

CMD ["/bin/bash","consumer/bin/consumer"]