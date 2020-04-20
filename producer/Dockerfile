FROM openjdk:11.0.6-jre

ENV TZ=America/Sao_Paulo
RUN echo $TZ > /etc/timezone

WORKDIR /opt

COPY build/distributions/wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

COPY build/distributions/wait-for-health.sh wait-for-health.sh
RUN chmod +x wait-for-health.sh

COPY build/distributions/producer-boot*.zip producer.zip

RUN unzip producer.zip && \
    rm -rf *.zip && \
    mv producer-* producer

#ENTRYPOINT ["producer/bin/producer"]
CMD ["/bin/bash","producer/bin/producer"]