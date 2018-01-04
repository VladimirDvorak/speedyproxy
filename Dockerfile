FROM centos

MAINTAINER Vladimir Dvorak <vladimir.dvorak@vdsoft.eu>

RUN yum -y update \ 
&& yum -y install epel-release \ 
&& yum -y install certbot nginx 

RUN mv /etc/nginx /etc/nginx.orig

COPY etc/speedyproxy/ /etc/speedyproxy/
COPY etc/nginx    /etc/nginx
COPY ./run.sh    /


RUN mkdir -p /var/www/webroot/.well-known

RUN chmod -R 700 /etc/speedyproxy 
RUN chmod 755 /run.sh


EXPOSE 80/TCP 443/TCP

VOLUME ["/tmp/aaa"]

CMD ["/run.sh"]

