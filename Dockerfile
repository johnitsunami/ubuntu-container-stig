FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-apt \
    sshpass \
    apt \
    openssh-server \
    ca-certificates \
    libpam-pkcs11 \
    opensc 

RUN pip3 install ansible

WORKDIR /ansible

COPY . .

RUN ansible-playbook -i hosts.ini site.yml || true

CMD [ "ansible-playbook", "--version" ]