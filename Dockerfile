FROM ubuntu:18.04

ENV API_KEY xxx
ARG TERRAFORM_VERSION

RUN apt-get update -qq && apt-get -y install unzip wget

RUN set -eux; \
	\
	dpkgArch="$(dpkg --print-architecture)"; \
	case "${dpkgArch##*-}" in \
		amd64) url="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip" ;; \
	esac; \
	\
  wget -q ${url} && unzip terraform_${TERRAFORM_VERSION}_linux_386.zip && mv terraform /usr/bin/terraform

WORKDIR /uptimerobot

CMD mv provider/terraform-provider-uptimerobot terraform-provider-uptimerobot && \
  terraform init && \
	TF_VAR_api_key=$API_KEY terraform validate && \
	TF_VAR_api_key=$API_KEY terraform plan && \
	TF_VAR_api_key=$API_KEY terraform apply -auto-approve -parallelism=1
