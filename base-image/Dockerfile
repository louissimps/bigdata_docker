FROM arm64v8/openjdk:8-jre-slim

# Install necessary tools
RUN apt-get update && apt-get install -y wget curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables for various components
ENV HADOOP_VERSION="3.2.4" \
    HADOOP_MAJOR_VERSION="3.2" \
    SCALA_VERSION="2.13" \
    KAFKA_VERSION="3.2.0" \
    ZOOKEEPER_VERSION="3.5.9" \
    SPARK_VERSION="3.2.1" \
    HIVE_VERSION="3.1.3" \
    ZEPPELIN_VERSION="0.10.1" \
    TARBALL_DIR="/opt/tarballs"

# Create directories to store tarballs
RUN mkdir -p "$TARBALL_DIR"

# Download Hadoop tarball
RUN set -eux; \
    echo "Downloading Hadoop..."; \
    wget -O "$TARBALL_DIR/hadoop-$HADOOP_VERSION.tar.gz" "https://downloads.apache.org/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz"

# Download Kafka tarball
RUN set -eux; \
    echo "Downloading Kafka..."; \
    wget -O "$TARBALL_DIR/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" "https://archive.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"

# Download Zookeeper tarball
RUN set -eux; \
    echo "Downloading Zookeeper..."; \
    wget -O "$TARBALL_DIR/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz" "https://archive.apache.org/dist/zookeeper/zookeeper-$ZOOKEEPER_VERSION/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz"

# Download Spark tarball
RUN set -eux; \
    echo "Downloading Spark..."; \
    wget -O "$TARBALL_DIR/spark-$SPARK_VERSION-bin-hadoop$HADOOP_MAJOR_VERSION.tgz" "https://archive.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_MAJOR_VERSION.tgz"

# Download Hive tarball
RUN set -eux; \
    echo "Downloading Hive..."; \
    wget -O "$TARBALL_DIR/apache-hive-$HIVE_VERSION-bin.tar.gz" "https://downloads.apache.org/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz"

# Download Zeppelin tarball
RUN set -eux; \
    echo "Downloading Zeppelin..."; \
    wget -O "$TARBALL_DIR/zeppelin-$ZEPPELIN_VERSION-bin-all.tgz" "https://downloads.apache.org/zeppelin/zeppelin-$ZEPPELIN_VERSION/zeppelin-$ZEPPELIN_VERSION-bin-all.tgz"

# Expose environment variables for tarball paths
ENV HADOOP_TARBALL="$TARBALL_DIR/hadoop-$HADOOP_VERSION.tar.gz" \
    KAFKA_TARBALL="$TARBALL_DIR/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz" \
    ZOOKEEPER_TARBALL="$TARBALL_DIR/apache-zookeeper-$ZOOKEEPER_VERSION-bin.tar.gz" \
    SPARK_TARBALL="$TARBALL_DIR/spark-$SPARK_VERSION-bin-hadoop$HADOOP_MAJOR_VERSION.tgz" \
    HIVE_TARBALL="$TARBALL_DIR/apache-hive-$HIVE_VERSION-bin.tar.gz" \
    ZEPPELIN_TARBALL="$TARBALL_DIR/zeppelin-$ZEPPELIN_VERSION-bin-all.tgz"

CMD ["sh", "-c", "echo 'Base image with downloaded tarballs'"]
