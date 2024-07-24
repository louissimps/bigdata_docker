#!/bin/bash

# Array of service directories and corresponding image tags
services=(
  "hadoop-namenode louissimps/arm64-hadoop-namenode:3.2.4"
  "hadoop-datanode louissimps/arm64-hadoop-datanode:3.2.4"
  "hadoop-nodemanager louissimps/arm64-hadoop-nodemanager:3.2.4"
  "hadoop-resourcemanager louissimps/arm64-hadoop-resourcemanager:3.2.4"
  "hive-metastore louissimps/arm64-hive-metastore:3.1.3"
  "hive-server louissimps/arm64-hive-server:3.1.3"
  "kafka louissimps/arm64-kafka:3.2.0"
  "spark louissimps/arm64-spark:3.2.1"
  "zeppelin louissimps/arm64-zeppelin:0.10.1"
  "zookeeper louissimps/arm64-zookeeper:3.5.9"
)

# Loop through each service and build/push the image
for service in "${services[@]}"; do
  IFS=' ' read -r -a service_info <<< "$service"
  context_dir="${service_info[0]}"
  image_tag="${service_info[1]}"

  echo "Building and pushing image for $context_dir with tag $image_tag..."
  docker buildx build --no-cache --platform linux/arm64 -t "$image_tag" --push "$context_dir"
done

echo "All images have been built and pushed successfully."
