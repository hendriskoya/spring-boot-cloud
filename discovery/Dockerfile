FROM openjdk:11.0.6-jre

ENV TZ=America/Sao_Paulo
RUN echo $TZ > /etc/timezone

WORKDIR /opt

COPY build/distributions/wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

COPY build/distributions/wait-for-health.sh wait-for-health.sh
RUN chmod +x wait-for-health.sh

COPY build/distributions/discovery-boot-*.zip discovery.zip

RUN unzip discovery.zip && \
    rm -rf *.zip && \
    mv discovery-* discovery

CMD ["/bin/bash","discovery/bin/discovery"]