<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	ServerName api.backyardbrood.dev
	DocumentRoot /virtualhosts/api/web/
	<Directory /virtualhosts/api/web/>
		Options FollowSymLinks MultiViews
		AllowOverride None
		Order allow,deny
		allow from all
		AcceptPathInfo on
		RewriteEngine on
		RewriteBase /
		RewriteCond %{REQUEST_FILENAME} !-f
		RewriteCond %{REQUEST_URI} !=/favicon.ico
		RewriteRule ^(.*)$ /app.php [QSA,L]
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/api.backyardbrood.com.error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/api.backyardbrood.com.access.log combined

	RewriteLog ${APACHE_LOG_DIR}/api.backyardbrood.com.rewrite.log
	RewriteLogLevel 0
</VirtualHost>
