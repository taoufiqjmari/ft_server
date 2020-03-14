# CONTAINER
FROM debian:buster
EXPOSE 80 443
COPY srcs/* ./home/

# PREREQUISITE
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade
RUN apt-get install -y wget unzip vim

# NGINX
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN mv ./home/default ./etc/nginx/sites-available/

# SSL
RUN mv ./home/serverssl.crt ./etc/ssl/certs/
RUN mv ./home/serverssl.key ./etc/ssl/private/

# PHPMYADMIN
RUN apt-get install -y php7.3 php7.3-common php7.3-mbstring php7.3-mysql php7.3-fpm
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.zip
RUN unzip phpMyAdmin-4.9.4-all-languages.zip
RUN rm -rf phpMyAdmin-4.9.4-all-languages.zip
RUN mv phpMyAdmin-4.9.4-all-languages ./var/www/html/phpmyadmin
RUN mkdir /var/www/html/phpmyadmin/tmp
RUN chmod -R 777 /var/www/html/phpmyadmin/tmp
RUN mv ./home/config.inc.php /var/www/html/phpmyadmin/

# MYSQL
RUN apt-get update
RUN apt-get install -y lsb-release gnupg
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb

#WORDPRESS
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -rf latest.zip
RUN mv ./home/wp-config.php wordpress
RUN mv wordpress /var/www/html/
RUN mv ./home/index.php /var/www/html

CMD ["bash", "./home/run.sh"]
