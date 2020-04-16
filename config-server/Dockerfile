FROM openjdk:11.0.6-jre

WORKDIR /opt

COPY build/distributions/config-server-boot*.zip config-server.zip

RUN unzip config-server.zip && \
    rm -rf *.zip && \
    mv config-server-* config-server

#ENTRYPOINT configures a container that will run as an executable.
#ENTRYPOINT ["config-server/bin/config-server"]

#CMD sets default command and/or parameters, which can be overwritten from command line when docker container runs.
CMD ["/bin/bash", "config-server/bin/config-server"]