FROM nginx:latest
RUN apt-get update && apt-get -y install gawk netpbm imagemagick make
ADD . /usr/share/nginx/html
ADD . /root
WORKDIR /root
RUN make all
