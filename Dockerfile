FROM progrium/busybox
MAINTAINER martin@englund.nu

ADD https://s3-us-west-2.amazonaws.com/skalera/vagrant/influxd-0.9.0_rc16 /usr/bin/influxd
RUN chmod 755 /usr/bin/influxd

EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxd"]
CMD ["-config=/data/config.toml"]
