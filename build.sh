set -e
API_KEY="xxx"
TERRAFORM_VERSION="0.11.14"
docker build -t uptimerobot-terraform --build-arg TERRAFORM_VERSION=$TERRAFORM_VERSION .
docker run -v ${PWD}:/uptimerobot -e API_KEY=$API_KEY uptimerobot-terraform 