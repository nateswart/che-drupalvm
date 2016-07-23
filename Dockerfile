FROM codenvy/ubuntu_jre

RUN apt-get update && apt-get install -y git unzip && \
  git clone https://github.com/geerlingguy/drupal-vm.git

CMD tail -f /dev/null
