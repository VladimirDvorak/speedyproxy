FROM centos

MAINTAINER Vladimir Dvorak <vladimir.dvorak@vdsoft.eu>

RUN yum -y update \ 
&& yum -y install epel-release \ 
&& yum -y install certbot nginx 

COPY etc/hosting/ /etc/hosting/

RUN mkdir -p /var/www/webroot/.well-known
RUN chmod 700 /etc/hosting


EXPOSE 80/TCP 443/TCP

VOLUME ["/etc/nginx/hosting"]

