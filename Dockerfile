FROM ubuntu:latest

# Versions
ENV KUBECTL_VERSION="1.14.6"
ENV IAMAUTH_VERSION="1.14.6"
# ENV AWSCLI1_VERSION "1.18.128"

# Install Tools
RUN \
  apt-get update && \
  apt-get install -y curl bash zip unzip

# Install Tools for AWS CLI 1.x
# RUN \
#   apt-get update && \
#   apt-get install -y python3-pip python3-dev curl bash unzip && \
#   cd /usr/local/bin && \
#   ln -s /usr/bin/python3 python && \
#   pip3 install --upgrade pip
# Install AWS CLI 1.x
# RUN \
#   pip3 install awscli==${AWSCLI1_VERSION} --upgrade --user

# Install AWS CLI 2.x
RUN \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  aws --version

# Install Kubectl
RUN \
  curl -o kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/${KUBECTL_VERSION}/2019-08-22/bin/linux/amd64/kubectl  && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

# Install IAM Autenticatior
RUN \
  curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/${IAMAUTH_VERSION}/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x ./aws-iam-authenticator && \
  mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator