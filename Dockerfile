FROM fedora:latest
WORKDIR /var/www/html/
COPY . .
RUN dnf -y update && \
    dnf -y install httpd
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]


