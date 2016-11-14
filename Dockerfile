FROM centos
ADD . /root
RUN yum -y groupinstall 'Development Tools' && yum install -y openssl-devel && cd /root/nginx &&  ./configure --without-http_rewrite_module --without-http_gzip_module --add-module=../nginx-rtmp --prefix=/root && make && make install
EXPOSE 1935
ENTRYPOINT /root/sbin/nginx -c /root/nginx.conf
