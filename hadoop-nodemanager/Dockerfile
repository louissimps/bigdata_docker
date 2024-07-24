FROM louissimps/arm64-base-image:latest

ENV YARN_CONF_yarn_nodemanager_local_dirs=file:///hadoop/yarn/local
RUN mkdir -p /hadoop/yarn/local
VOLUME /hadoop/yarn/local

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

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
