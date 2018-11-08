#!/bin/bash
echo """Implemententacion de Odoo Saas, librerias, modulos y dependencias
"""
export USER=$1
export SAAS_VERSION=$2

cd /home/o${USER}/odoo-repo
sed -i 's/matches="[^"]*"//g' addons/web/static/src/xml/base.xml

su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/it-projects-llc/odoo-saas-tools.git odoo-repo/odoo-saas-tools"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/OCA/e-commerce.git odoo-repo/e-commerce"
su - ${USER} -c "git clone -b ${SAAS_VERSION}  --single-branch --depth=10 https://github.com/it-projects-llc/access-addons.git odoo-repo/access-addons"
pip install -r odoo-saas-requirements.txt

apt-get install nginx


