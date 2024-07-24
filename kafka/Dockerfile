FROM louissimps/arm64-base-image:latest
ENV KAFKA_VERSION=3.2.0 \
    SCALA_VERSION=2.13 \
    KAFKA_HOME=/opt/kafka \
    PATH=$KAFKA_HOME/bin:$PATH
    
    
    # Extract Kafka tarball
    RUN tar -xzvf "$KAFKA_TARBALL" -C /opt/ \
        && mv /opt/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION" /opt/kafka\
        && rm -rf /opt/tarballs
    
    # Copy configuration files from the context directory
    COPY server.properties $KAFKA_HOME/config/
    
    # Copy and set permissions for the run script
    COPY run.sh /run.sh
    RUN chmod +x /run.sh
    
    EXPOSE 9092
    
    CMD ["/run.sh"]
