<VirtualHost *:80>
    DocumentRoot "/srv/http/site1vhost/www"
    ServerName site1vhost.com
    ServerAlias www.site1vhost.com
    ErrorLog "/srv/http/site1vhost/log/site1vhost-error_log"
    CustomLog "/srv/http/site1vhost/log/site1vhost-access_log" common
    <Directory "/srv/http/site1vhost">
        Require all granted
    </Directory>
</VirtualHost>
