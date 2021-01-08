# update yum 
yum update -y

# install 
yum -y gcc gcc-c++ 
# remove docker 
yum remove docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-engine

# yum packages
yum install -y yum-utils

# add yum resource 
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# yum install docker 
yum install -y docker-ce docker-ce-cli containerd.io