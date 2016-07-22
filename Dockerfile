FROM ubuntu

RUN apt-get update && \
    apt-get -y install git
    
RUN git clone https://github.com/geerlingguy/drupal-vm.git

WORKDIR /projects/drupal-vm

RUN cp /projects/drupal-vm/xamples/prod/prod.config.yml /projects/drupal-vm/examples/prod/config.yml
RUN cp /projects/drupal-vm/examples/prod/example.inventory /projects/drupal-vm/examples/prod/inventory 

RUN ansible-playbook -i /projects/drupal-vm/examples/prod/inventory /projects/drupal-vm/examples/prod/bootstrap/init.yml -e "ansible_ssh_user=root"
RUN ansible-playbook -i /projects/drupal-vm/examples/prod/inventory /projects/drupal-vm/provisioning/playbook.yml

EXPOSE 80 443 3306

CMD tail -f /dev/null
