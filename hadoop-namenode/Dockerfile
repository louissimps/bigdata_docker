FROM louissimps/arm64-base-image:latest

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

RUN apt-get update && apt-get install -y wget curl

# Download and install Hadoop
ENV HADOOP_VERSION=3.2.4 \
    HADOOP_HOME=/opt/hadoop \
    PATH=$HADOOP_HOME/bin:$PATH

# Extract Hadoop tarball
RUN tar -xzvf "$HADOOP_TARBALL" -C /opt/ \
    && mv /opt/hadoop-"$HADOOP_VERSION" /opt/hadoop\
    && rm -rf /opt/tarballs


COPY core-site.xml /opt/hadoop/etc/hadoop/
COPY hdfs-site.xml /opt/hadoop/etc/hadoop/

COPY run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 9864

CMD ["/run.sh"]
