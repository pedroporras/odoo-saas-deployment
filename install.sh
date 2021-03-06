#!/bin/bash
echo """Implemententacion de Odoo Saas, librerias, modulos y dependencias
wget https://raw.githubusercontent.com/pedroporras/odoo-saas-deployment/master/install.sh -O saas-install.sh
chmod +x saas-install.sh
./saas-install.sh myusros odoo_version  # Change 'myusros' to use your custom OS' user name
"""
export USER=$1
export SAAS_VERSION=$2

cd /home/${USER}/odoo-repo
sed -i 's/matches="[^"]*"//g' addons/web/static/src/xml/base.xml
apt-get update
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/pedroporras/odoo-saas-tools.git odoo-repo/odoo-saas-tools"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/OCA/e-commerce.git odoo-repo/e-commerce"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/it-projects-llc/access-addons.git odoo-repo/access-addons"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/OCA/contract.git odoo-repo/contract"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/it-projects-llc/website-addons.git odoo-repo/website-addons"


wget https://raw.githubusercontent.com/pedroporras/odoo-saas-deployment/master/odoo-saas-requirements.txt -O /tmp/rp-saas.txt
pip install requests --upgrade
pip install client
pip install -r /tmp/rp-saas.txt

apt-get install -y nginx
cd /etc/nginx
wget https://raw.githubusercontent.com/pedroporras/odoo-saas-deployment/master/odoo-saas -O /etc/nginx/sites-enabled/odoo-saas
mv /etc/nginx/sites-enabled/odoo-saas /etc/nginx/sites-enabled/default
nginx -t
service nginx start
/etc/init.d/nginx reload





