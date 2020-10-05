# change apt soft source to Chinese mirror site
sudo sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

# import openresty GPG key:
wget -qO - https://openresty.org/package/pubkey.gpg | sudo apt-key add -
sudo apt update
sudo apt install -y software-properties-common
# add openresty repo
sudo add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main"

# add git ppa repo
sudo add-apt-repository ppa:git-core/ppa -y

# to update the APT index:
sudo apt-get update
# install depends soft
sudo apt-get install -y openresty build-essential libssl-dev git htop

# code by https://stackoverflow.com/a/63748803/7001350 
# download GeoLite2-City database file
#curl "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=vP65qsGQCxfewnTs&suffix=tar.gz" -o /tmp/GeoLite2-Country.tar.gz \
#   && tar -xzvf /tmp/GeoLite2-City.tar.gz -C /tmp/ \
#   && mv GeoLite2-City_*/GeoLite2-City.mmdb /tmp/GeoLite2-City.mmdb

# download GeoLite2-Country database file
# curl "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=vP65qsGQCxfewnTs&suffix=tar.gz" -o /tmp/GeoLite2-Country.tar.gz \
#    && tar -xzvf /tmp/GeoLite2-Country.tar.gz -C /tmp/ \
#    && mv GeoLite2-Country_*/GeoLite2-Country.mmdb /tmp/GeoLite2-Country.mmdb

# opm install anjia0532/lua-resty-maxminddb lib
sudo opm --install-dir /usr/local/openresty/ get anjia0532/lua-resty-maxminddb
# overwrite nginx config file
sudo cp /vagrant/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
# test openresty config file
sudo /usr/local/openresty/bin/openresty -t
# reload openresty config 
sudo /usr/local/openresty/bin/openresty -s reload

sudo cp /vagrant/* /tmp/
sudo chmod +x /tmp/wrk