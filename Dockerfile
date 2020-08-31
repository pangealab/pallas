FROM ubuntu:latest

# Versions
ENV KUBECTL_VERSION="1.14.6"
ENV IAMAUTH_VERSION="1.14.6"

# Install Tools
RUN \
  apt-get update && \
  apt-get install -y curl bash unzip

# Install AWS CLI
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