FROM louissimps/arm64-base-image:latest

ENV ZEPPELIN_VERSION="0.10.1" \
    ZEPPELIN_HOME="/opt/zeppelin"

ENV PATH=$ZEPPELIN_HOME/bin:$PATH

# Extract Zeppelin tarball
RUN tar -xzvf "$ZEPPELIN_TARBALL" -C /opt/ \
    && mv /opt/zeppelin-"$ZEPPELIN_VERSION"-bin-all $ZEPPELIN_HOME \
    && rm -rf /opt/tarballs    

# Copy configuration files from the context directory
COPY zeppelin-site.xml $ZEPPELIN_HOME/conf/

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8087

CMD ["/run.sh"]
