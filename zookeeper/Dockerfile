FROM louissimps/arm64-base-image:latest

ENV ZOOKEEPER_VERSION="3.5.9" \
    ZOOKEEPER_HOME="/opt/zookeeper"

ENV PATH=$ZOOKEEPER_HOME/bin:$PATH

# Extract Zookeeper tarball
RUN tar -xzvf "$ZOOKEEPER_TARBALL" -C /opt/ \
    && mv /opt/apache-zookeeper-"$ZOOKEEPER_VERSION"-bin $ZOOKEEPER_HOME \
    && rm -rf /opt/tarballs
    
# Copy configuration files from the context directory
COPY zoo.cfg $ZOOKEEPER_HOME/conf/

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 2181

CMD ["/run.sh"]
