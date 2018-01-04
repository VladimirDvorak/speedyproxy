FROM centos

MAINTAINER Vladimir Dvorak <vladimir.dvorak@vdsoft.eu>

RUN yum -y update \ 
&& yum -y install epel-release \ 
&& yum -y install certbot nginx 

COPY etc/speedyproxy/ /etc/speedyproxy/

RUN mkdir -p /var/www/webroot/.well-known
RUN chmod 700 /etc/speedyproxy


EXPOSE 80/TCP 443/TCP

VOLUME ["/etc/nginx/hosting"]

