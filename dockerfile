FROM centos
RUN yum install httpd wget unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/emailler.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip emailler.zip && mv html/* .
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
