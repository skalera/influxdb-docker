influxdb-docker
===============

This container requires a data directory mount on `/data`,

    mkdir -p ~/data/log
    cp config.toml ~/data
    docker run --name influxdb -p 8083:8083 -p 8086:8086 -v ~/data:/data skalera/influxdb
