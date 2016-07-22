FROM ubuntu

RUN apt-get update && \
    apt-get -y install git
    
CMD git clone https://github.com/geerlingguy/drupal-vm.git

CMD cp drupal-vm/examples/prod/prod.config.yml config.yml

EXPOSE 80 443 3306

CMD tail -f /dev/null
