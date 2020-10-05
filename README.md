# lua-resty-maxminddb-vagrant
vagrant project for openresty's lib lua-resty-maxminddb

```bash

## install virtualbox + vagrant

vagrant up
vagrant ssh
cd /tmp

./wrk -t50 -c200 -d120s -s ./test.lua --latency http://127.0.0.1

# use htop to monitoring memory and cpu usage
```