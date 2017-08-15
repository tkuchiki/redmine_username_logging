# Redmine Username Logging Plugin

This plugin add Redmine-User header to http response

## Installaction

```
$ git clone https://github.com/tkuchiki/redmine_username_logging plugins/redmine_username_logging
# restart redmine
```

## Configuration

### Apache

```apache
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %T %D %{Redmine-User}o" combined
```

#### Example

```
172.23.0.1 - - [15/Aug/2017:14:21:16 +0900] "GET /redmine/admin/plugins HTTP/1.1" 200 21568 "http://localhost:8080/redmine/admin" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" 46 46293551 tkuchiki
```

### Nginx

```nginx
log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                '$status $body_bytes_sent "$http_referer" '
                '"$http_user_agent" "$http_x_forwarded_for" "$sent_http_redmine_user"';
```

#### Example

```
172.23.0.1 - - [15/Aug/2017:14:21:16 +0900] "GET /redmine/admin/plugins HTTP/1.1" 200 21568 "http://localhost:8080/redmine/admin" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" "-" "tkuchiki"
```
