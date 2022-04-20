FROM amd64/ubuntu:16.04
MAINTAINER kiyopon.onopon@gmail.com
 
RUN apt -y update && apt -y upgrade && apt list --upgradable && apt install -y -q checkinstall libncursesw5-dev libsqlite3-dev tk-dev libgdbm-dev libbz2-dev libssl-dev libsqlite3-dev libffi-dev libpython3-dev wget curl apache2 mysql.client language-pack-ja-base language-pack-ja
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar xzvf ./Python-3.7.4.tgz
WORKDIR /Python-3.7.4/
RUN ./configure --enable-shared --enable-optimizations
RUN make altinstall
RUN ln /usr/local/lib/libpython3.7m.so.1.0 /lib/
RUN ln /usr/local/bin/python3.7 /usr/local/bin/python
RUN ln /usr/local/bin/pip3.7 /usr/local/bin/pip
RUN a2enmod headers cgid rewrite
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN mkdir app
WORKDIR /app
RUN rm -rf /Python-3.7.4.tgz /Python-3.7.4 /etc/apache2/sites-enabled/000-default.conf
EXPOSE 80
CMD ["/bin/sh"]
