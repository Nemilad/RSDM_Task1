<VirtualHost *:80>
    DocumentRoot "/srv/http/site2vhost/www"
    ServerName site2vhost.com
    ServerAlias www.site2vhost.com
    ErrorLog "/srv/http/site2vhost/log/site2vhost-error_log"
    CustomLog "/srv/http/site2vhost/log/site2vhost-access_log" common
    <Directory "/srv/http/site2vhost">
        Require all granted
	Allow from all
	Options -MultiViews
    </Directory>
    WSGIScriptAlias / /srv/http/site2vhost/www/script.py
</VirtualHost>
