FROM ubuntu

RUN apt-get update && \
    apt-get -y install git
    
RUN git clone https://github.com/geerlingguy/drupal-vm.git

WORKDIR /projects/drupal-vm

CMD tail -f /dev/null
