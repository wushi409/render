#使用Ubuntu22.84作为基础镜像
FROM ubuntu:22.04

#安装Shel1 inabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#设置root用户的密码为'root'
RUN echo 'root:123456' | chpasswd

#暴露22端口
EXPOSE 22

#启动Shel1 inabox
CMD ["/usr/bin/shellinaboxd","-t","-s","/:LOGIN"]
