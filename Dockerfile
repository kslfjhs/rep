FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://raw.githubusercontent.com/uncleluogithub/areyouok/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:hhy54199|chpasswd 
# uncleluo 是ssh密码
RUN chmod 755 /luo.sh
CMD  /luo.sh
