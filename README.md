# odoo-saas-deployment
Steps to deploy Odoo Saas 11

Para el archivo odoo-server.service 
  - Ingresamos con el usuario root
  - Este debe ser creado en la carpeta /etc/systemd/system
  - systemctl daemon-reload
  - Luego se ejecuta systemctl start odoo-server
  - Para comprobar el estado del proceso ejecutamos systemctl status odoo-server 
  - Si se ejecuta correctamente ejecutamos systemctl enable odoo-server
  
  
Para el archivo .odoorc
  - Se debe cambiar la linea de db_host
  - Se debe cambiar la linea de db_name
  - Se debe cambiar la linea de db_password
  - Se debe cambiar la linea de db_user
  - Se debe cambiar la linea de admin_passwd
  - Se debe cambiar la linea de db_port
  - Se debe cambiar la linea de workers
  
  

