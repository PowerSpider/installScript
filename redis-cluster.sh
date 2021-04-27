#! /bin/bash
# @Author       : Payne
# @Email        : wuzhipeng1289690157@gmail.com
# REDIS VERSION : 6.2.2

# Global variable
redis_version="redis-6.2.2"
RedisPath=(3220 3221 3222 3223 3224 3225 3226 3227 3228)

# download redis
function download() {
  echo -e "downloading ${redis_version} ...\n"
  curl -O "https://download.redis.io/releases/${redis_version}.tar.gz"
  echo -e "Successfully installed ${redis_version} ...\n"
}

# Create cluster
# Need to comment on buildIp、port  first
function ContentsPath() {
  for element in "${RedisPath[@]}"; do
    mkdir "${element}"
    cd "${element}" || exit
    cp ../redis.conf ./
    echo "port ${element}" >>redis.conf
    echo "cluster-enabled yes" >>redis.conf
    echo "cluster-config-file nodes-${element}.conf" >>redis.conf
    echo "cluster-node-timeout 5000" >>redis.conf
    cd ../
  done
}

# BuildCluster
function BuildCluster() {
  for element in "${RedisPath[@]}"; do
    cd "${element}" || exit
    redis-server redis.conf || exit
    cd ..
  done
}

main() {
  ContentsPath
  BuildCluster
}
main

#redis-trib.rb create -a bWc7812caZ --replicas 2 \
#    192.168.0.186:3220 192.168.0.186:3221 192.168.0.186:3222 192.168.0.186:3223 192.168.0.186:3224 192.168.0.186:3225 192.168.0.186:3226 192.168.0.186:3227 192.168.0.186:3228

#redis-cluster