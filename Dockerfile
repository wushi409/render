FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openssh-server shellinabox && \
    mkdir -p /var/run/sshd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo 'root:123456' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22 4200

CMD ["/bin/bash", "-lc", "/usr/sbin/sshd && /usr/bin/shellinaboxd -t -s /:LOGIN -p 4200 && tail -f /dev/null"]
