FROM ubuntu:14.04

ADD http://s3.amazonaws.com/influxdb/influxdb_0.8.2_amd64.deb /influxdb_latest_amd64.deb

RUN mkdir -p /opt/influxdb/shared/data
RUN dpkg -i /influxdb_latest_amd64.deb
RUN rm /influxdb_latest_amd64.deb
RUN rm -rf /opt/influxdb/shared/data
RUN chown -R daemon:daemon /opt/influxdb

USER daemon
EXPOSE 8083 8086

ENTRYPOINT ["/usr/bin/influxdb"]
CMD ["-config=/opt/influxdb/shared/config.toml"]
