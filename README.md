# Redis Cluster configuration with HaProxy

Slides regarding this topic: https://docs.google.com/presentation/d/12KBX74pPPmcqfBQnOACOeCOhBpKe8au5kYnlvFPJBSc/edit?usp=sharing

An example configuration for running a [Redis cluster](https://redis.io/topics/cluster-tutorial) behind a load balancer [HaProxy](http://www.haproxy.org/). 

HaProxy configuration is auto update via a service discovery tool: [Consul](https://www.consul.io/). All containers are automaticaly registered to Consul via the registrator. Please read the official documentation to learn more about it.

You could also check the registry via the command line:

```
$ curl http://127.0.0.1:8500/v1/catalog/services
``` 

If you would like to have more details about the Redis service: 

```
$ curl http://127.0.0.1:8500/v1/catalog/service/redis
```

Example of result:
```
[{"Node":"127.0.0.1","Address":"127.0.0.1","ServiceID":"127.0.0.1:docker_master_1:6379","ServiceName":"redis","ServiceTags":[],"ServiceAddress":"172.24.0.4","ServicePort":6379,"ServiceEnableTagOverride":false,"CreateIndex":4037,"ModifyIndex":4037},{"Node":"127.0.0.1","Address":"127.0.0.1","ServiceID":"127.0.0.1:docker_slave_1:6379","ServiceName":"redis","ServiceTags":[],"ServiceAddress":"172.24.0.5","ServicePort":6379,"ServiceEnableTagOverride":false,"CreateIndex":4044,"ModifyIndex":4044},{"Node":"127.0.0.1","Address":"127.0.0.1","ServiceID":"127.0.0.1:docker_slave_2:6379","ServiceName":"redis","ServiceTags":[],"ServiceAddress":"172.24.0.10","ServicePort":6379,"ServiceEnableTagOverride":false,"CreateIndex":4053,"ModifyIndex":4053}]%
```

## Running the cluster

```
$ chmod +x setup.sh 
$ sh setup.sh
```

## Simulate an issue with the redis master

``` 
$ chmod +x test.sh
$ sh test.sh
```


No warranty or support. Use as you wish.
