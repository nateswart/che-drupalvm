FROM ubuntu

RUN apt-get update && apt-get install -y git && \
  git clone https://github.com/geerlingguy/drupal-vm.git

CMD tail -f /dev/null
