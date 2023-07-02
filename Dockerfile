FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd wget unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/emailler.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip emailler.zip && mv html/* .
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
