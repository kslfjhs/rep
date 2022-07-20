FROM ubuntu
RUN apt update
RUN apt install ssh wget npm -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:hhy54199|chpasswd 
# uncleluo 是ssh密码
RUN chmod 755 /luo.sh
CMD  /luo.sh
