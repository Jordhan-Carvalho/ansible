FROM ubuntu:jammy AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get -y install sudo && \
    apt-get autoremove --yes

FROM base AS prime
ARG TAGS
RUN addgroup --gid 1000 jordhan
RUN adduser --gecos jordhan --uid 1000 --gid 1000 --disabled-password jordhan && echo 'jordhan:123' | chpasswd
RUN echo '%jordhan ALL=(ALL) ALL' >> \
/etc/sudoers
WORKDIR /home/jordhan

FROM prime
COPY . .
RUN chown -R jordhan:jordhan /home/jordhan/.ssh
USER jordhan
CMD ["sh", "-c", "ansible-playbook $TAGS ubuntu.yml"]
