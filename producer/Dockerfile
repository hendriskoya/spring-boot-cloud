FROM openjdk:11.0.6-jre

WORKDIR /opt

COPY build/distributions/producer-boot*.zip producer.zip

RUN unzip producer.zip && \
    rm -rf *.zip && \
    mv producer-* producer

#ENTRYPOINT ["producer/bin/producer"]
CMD ["/bin/bash","producer/bin/producer"]