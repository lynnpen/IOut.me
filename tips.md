Tips
====

## Git / Github


#### tags

```shell
git tag v1.0
git push origin --tags

```


## Python

#### 使用 assert 断言


```python
assert not self.crawling, "Crawling already taking place"
```


#### 利用 or 运算符的执行细节简化代码


```python
assert not self.crawling, "Crawling already taking place"
```


#### http 模拟


1. method 优化

```python
method = str(method).upper()
```

#### HTTP server

```python
python -m SimpleHTTPServer 8000
```

#### 时间处理

```python
today = lambda: time.strftime('%Y%m%d', time.localtime())
time.strptime(t, '%Y-%m-%d %H:%M:%S')
```


## Redis

查看所有 key

```redis
> keys *
```
