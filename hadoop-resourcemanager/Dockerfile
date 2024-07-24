FROM louissimps/arm64-base-image:latest

# Set environment variables for Hadoop
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$HADOOP_HOME/bin:$PATH

# Extract Hadoop tarball
RUN tar -xzvf "$HADOOP_TARBALL" -C /opt/ \
    && mv /opt/hadoop-"$HADOOP_VERSION" /opt/hadoop\
    && rm -rf /opt/tarballs

# Copy configuration files from the context directory
COPY core-site.xml /opt/hadoop/etc/hadoop/
COPY yarn-site.xml /opt/hadoop/etc/hadoop/

# Create necessary directories and set volumes
RUN mkdir -p /hadoop/yarn/local /hadoop/yarn/log
VOLUME /hadoop/yarn/local /hadoop/yarn/log

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
