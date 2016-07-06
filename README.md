influxdb-docker
===============

Test build

    docker build -t skalera/influxdb .

This container requires a data directory mount on `/data`,

    mkdir -p ~/data
    docker run --name influxdb -v ~/data:/data skalera/influxdb

## Verification

    curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE test"
    curl -X POST 'http://localhost:8086/write' -d '{"database":"test","points":[{"name":"test","tags":{"tag1":"value1"},"fields":{"value":1.2}}]}'
    curl -G 'http://localhost:8086/query' --data-urlencode "db=test" --data-urlencode "q=SELECT value FROM test WHERE tag1='value1'"
