FROM louissimps/arm64-base-image:latest

ENV SPARK_VERSION="3.2.1" \
    HADOOP_MAJOR_MINOR="3.2" \
    SPARK_HOME="/opt/spark"

ENV PATH=$SPARK_HOME/bin:$PATH

# Extract Spark tarball
RUN tar -xzvf "$SPARK_TARBALL" -C /opt/ \
    && mv /opt/spark-"$SPARK_VERSION"-bin-hadoop"$HADOOP_MAJOR_MINOR" $SPARK_HOME \
    && rm -rf /opt/tarballs  

# Copy configuration files from the context directory
COPY hive-site.xml $SPARK_HOME/conf/

# Copy and set permissions for the run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 8081

CMD ["/run.sh"]
