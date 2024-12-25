FROM debian:11-slim

LABEL maintainer="Diego de Jesus diego@asf.com"
ENV PORT=80

RUN apt update && apt install apache2 php php7.4 php7.4-mysql -y \
    && a2enmod php7.4 # ou a versão do PHP desejada

# Remove o arquivo index.html padrão
RUN rm -f /var/www/html/index.html

COPY ./web/ /var/www/html

EXPOSE $PORT

WORKDIR /etc/apache2

CMD ["apachectl", "-D", "FOREGROUND"]
