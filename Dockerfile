FROM ubuntu

RUN apt-get update && \
    apt-get -y install git
    
RUN git clone https://github.com/geerlingguy/drupal-vm.git

WORKDIR /projects/drupal-vm

RUN cp examples/prod/prod.config.yml examples/prod/config.yml
RUN cp examples/prod/example.inventory examples/prod/inventory 

RUN ansible-playbook -i examples/prod/inventory examples/prod/bootstrap/init.yml -e "ansible_ssh_user=root"
RUN ansible-playbook -i examples/prod/inventory provisioning/playbook.yml

EXPOSE 80 443 3306

CMD tail -f /dev/null
