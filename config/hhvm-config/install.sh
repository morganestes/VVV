# Install HHVM
echo "Setup the HHVM repository"
sudo wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
echo deb http://dl.hhvm.com/ubuntu trusty main | sudo tee /etc/apt/sources.list.d/hhvm.list
sudo apt-get update
sudo apt-get install hhvm -y --force-yes
sudo chown vagrant /etc/hhvm

echo "Move HHVM my-php.ini"
cd /
sudo cp /srv/www/__hhvvvm/hhvm-config/php.ini /etc/hhvm/my-php.ini
sudo hhvm -m daemon -c /etc/hhvm/my-php.ini -vEval.EnableXHP=1
sudo update-rc.d hhvm defaults

# Restart NGINX
echo "Restart nginx to apply HHVM changes"
sudo service nginx restart
sudo service hhvm restart

# Init script for all custom sites
echo "Commencing Custom Sites Setup"
echo "Copying NGINX HHVM WordPress configuration"

cd /
sudo cp /srv/www/__hhvvvm/nginx-hhvm.conf-sample /etc/nginx/nginx-hhvm.conf
echo " * /srv/www/__hhvvvm/nginx-hhvm.conf-sample -> /etc/nginx/nginx-hhvm.conf"

# Let the user know the good news
echo "Custom WordPress sites will now work with HHVM"
