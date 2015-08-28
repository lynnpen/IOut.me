运维
====

## Nginx

#### 启动与关闭

```shell
$ sudo nginx  # start
$ sudo nginx -s stop  # fast shutdown
$ sudo nginx -s quit  # graceful shutdown. waiting for the worker processes to finish serving current requests
$ sudo nginx -s reload  # reloading the configuration file
```


正常启动后的进程:

one master process and several worker processes.
The main purpose of the master process is to read and evaluate configuration,
and maintain worker processes.
Worker processes do actual processing of requests.

```shell
$ ps -ax | grep nginx
24577 ?        Ss     0:00 nginx: master process nginx
24578 ?        S      0:00 nginx: worker process
24579 ?        S      0:00 nginx: worker process
24580 ?        S      0:00 nginx: worker process
24581 ?        S      0:00 nginx: worker process
24615 pts/0    S+     0:00 grep --color=auto nginx
```

#### Configuration File’s Structure

- simple directives: consists of the name and parameters separated by spaces and ends with a semicolon (;).
- block directives

If a block directive can have other directives inside braces,
it is called a context (examples: events, http, server, and location).
