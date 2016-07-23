FROM ubuntu

RUN apt-get update && apt-get install -y \  
  git
    
RUN git clone https://github.com/geerlingguy/drupal-vm.git
