FROM node
ADD . /root
RUN apt-get update \
  && apt-get install -y libssl-dev \
  && cd /root/nginx \
  &&  ./configure --without-http_rewrite_module --without-http_gzip_module --add-module=../nginx-rtmp --prefix=/root \
  && make \
  && make install
EXPOSE 1935
ENTRYPOINT /root/sbin/nginx -c /root/nginx.conf
