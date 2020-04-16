FROM openjdk:11.0.6-jre

WORKDIR /opt

COPY build/distributions/producer-boot*.zip producer.zip

RUN unzip producer.zip && \
    rm -rf *.zip && \
    mv producer-* producer

COPY wait-for-it.sh wait-for-it.sh
RUN chmod +x wait-for-it.sh

#ENTRYPOINT ["producer/bin/producer"]
CMD ["/bin/bash","producer/bin/producer"]