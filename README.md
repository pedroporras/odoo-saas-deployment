# odoo-saas-deployment
Steps to deploy Odoo Saas 11

Para el archivo odoo-server.service 
  - Ingresamos con el usuario root
  - Este debe ser creado en la carpeta /etc/systemd/system
  - Luego se ejecuta systemctl start odoo-server
  - Para comprobar el estado del proceso ejecutamos systemctl state odoo-server 
  - Si se ejecuta correctamente ejecutamos systemctl enable odoo-server
  
  

