consul examples

1) run one node
    1. docker compose up
2) run cluster (client load balancing example)
    1. run consul on host1 :
          docker run --name=consul -d -p 8300-8302:8300-8302 -p 8301:8301/udp -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp gliderlabs/consul-server -server -bootstrap-expect 2 -ui -advertise host1

    2. run consul on host2 :
          docker run --name=consul -d -p 8300-8302:8300-8302 -p 8301:8301/udp -p 8302:8302/udp -p 8400:8400 -p 8500:8500 -p 8600:53/udp gliderlabs/consul-server -server -bootstrap-expect 2 -ui -advertise host2 -join host1

    3. run service1 on host1 :
          docker build -t service1 . --force-rm=true
          docker run -d --net=host -p 8080:8080 --name service1 -t service1
       run service1 on host2 :
          docker build -t service1 . --force-rm=true
          docker run -d --net=host -p 8080:8080 --name service1 -t service1
       run service2 on host2 :
          docker build -t service2 . --force-rm=true
          docker run -d --net=host -p 8081:8081 --name service2 -t service2
