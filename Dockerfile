FROM progrium/busybox
MAINTAINER martin@englund.nu

ADD http://s3.amazonaws.com/influxdb/influxdb-0.8.8.amd64.tar.gz /tmp/influxdb.tgz

RUN gzip -d /tmp/influxdb.tgz
RUN tar xf /tmp/influxdb.tar

RUN cp /build/influxdb /usr/bin
RUN mkdir /etc/influxdb
RUN cp /build/config.toml /etc/influxdb
RUN rm -rf /build /tmp/influxdb.*

RUN opkg-install zlib libbz2
RUN ln -s /usr/lib/libbz2.so.1.0 /usr/lib/libbz2.so.1

EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/data/config.toml"]
