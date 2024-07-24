FROM louissimps/arm64-base-image:latest

# Set environment variables for Hive
ENV HIVE_HOME=/opt/hive
ENV PATH=$HIVE_HOME/bin/$PATH
ENV HIVE_VERSION=3.1.3
# Extract Hive tarball
RUN tar -xzvf "$HIVE_TARBALL" -C /opt/ \
    && mv /opt/apache-hive-"$HIVE_VERSION"-bin /opt/hive\
    && rm -rf /opt/tarballs

# Copy configuration files from the context directory
COPY hive-site.xml $HIVE_HOME/conf/

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 10000

CMD ["/run.sh"]
