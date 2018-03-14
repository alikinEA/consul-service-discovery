consul examples

1)
    1. run consul agent on host1
        docker run --name=consul --net=consul -d -p 8300-8302:8300-8302 -p 8301:8301/udp -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp gliderlabs/consul-server -server -bootstrap-expect 2 -ui -advertise host1
    2. run consul agent on host2 and join
        docker run --name=consul --net=consul -d -p 8300-8302:8300-8302 -p 8301:8301/udp -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp gliderlabs/consul-server -server -bootstrap-expect 2 -ui -advertise host2 -join host1
2) docker network create consul
2) run service1
    1. clean install
    2. docker build -t service1 . --force-rm=true
    3. docker run -d --net=consul --name service1 -t service1