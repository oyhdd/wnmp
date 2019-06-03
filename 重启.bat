@echo off
echo Stopping Nginx...
taskkill /F /IM nginx.exe > nul
echo Stopping PHP FastCGI...
taskkill /F /IM php-cgi.exe > nul
echo Stopping PHP5 FastCGI...
taskkill /F /IM php5-cgi.exe > nul
echo Stopping Mysql...
taskkill /F /IM mysqld.exe > nul

set base_path=%cd%
set nginx_path=%base_path%\nginx
set php5_path=%base_path%\php\php-5.6.36
set php7_path=%base_path%\php\php-7.1.17
set mysql_path=%base_path%\mysql

echo Starting PHP5 FastCGI...
RunHiddenConsole %php5_path%\php5-cgi.exe -b 127.0.0.1:9000 -c %php5_path%\php.ini

echo Starting PHP7 FastCGI...
RunHiddenConsole %php7_path%\php-cgi.exe -b 127.0.0.1:9001 -c %php7_path%\php.ini

echo Starting Nginx...
RunHiddenConsole %nginx_path%\nginx.exe -c %nginx_path%\conf\nginx.conf

echo Starting MySql...
RunHiddenConsole %mysql_path%\bin\mysqld --defaults-file=%mysql_path%\my.ini --port=3306
echo please open http://127.0.0.1 ...
ping -n 3 127.0.0.1 > nul
start iexplore "http://127.0.0.1"
exit