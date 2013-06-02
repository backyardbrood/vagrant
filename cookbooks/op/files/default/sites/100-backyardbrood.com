<VirtualHost *:80>
	ServerAdmin webmaster@localhost
	ServerName backyardbrood.dev
	DocumentRoot /virtualhosts/website/web/

	<Directory /virtualhosts/website/web/>
		AllowOverride None
		Order allow,deny
		allow from all
		AcceptPathInfo on
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/backyardbrood.com.error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/backyardbrood.com.access.log combined

	RewriteLog ${APACHE_LOG_DIR}/backyardbrood.com.rewrite.log
	RewriteLogLevel 0
</VirtualHost>
