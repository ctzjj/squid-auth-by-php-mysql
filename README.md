# squid-auth-by-php-mysql
> php + mysql 做授权 squid 的授权
```html
auth_param basic program /usr/lib/squid/basic_mysql_auth
auth_param basic children 5
auth_param basic credentialsttl 5 minutes
auth_param basic realm my proxy
acl auth_user proxy_auth REQUIRED
http_access allow auth_user
```
