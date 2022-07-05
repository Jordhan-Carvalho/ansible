 FROM ubuntu:focal
 ARG TAGS
 ARG DEBIAN_FRONTEND=noninteractive
 WORKDIR /usr/local/bin
 RUN apt update && apt install -y software-properties-common && apt-add-repository -y ppa:ansible/ansible && apt update && apt install -y ansible curl git build-essential
 COPY . .
 # RUN addgroup --gid 1000 jordhan
 # RUN adduser --gecos jordhan --uid 1000 --gid 1000 --disabled-password jordhan
 # USER jordhan
 CMD ["sh", "-c", "ansible-playbook $TAGS ubuntu.yml"]
