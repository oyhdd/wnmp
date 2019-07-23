# wnmp

一键搭建PHP运行环境，基于 Windows + Nginx(1.14) + PHP(5.6 & 7.3) + MySql(5.6)，无需安装，一键启动、停止和重启

### 介绍

由于windows的PHP集成开发环境几乎都是Apache + PHP + MySql，每次想使用Nginx时都需要单独配置，比较麻烦，于是便集成了wnmp开发环境，并且可通过bat脚本一键启动、停止和重启。

### 使用说明

- 1、将项目解压后可放置于自定义的位置，然后运行 “开始.bat” 脚本即可一键启动nginx、php和mysql，并自动打开127.0.0.1的网页。

- 2、自己的项目代码放置在根目录的www目录下，然后可在nginx/conf/vhost/ 文件夹下添加自己的Nginx配置文件，Nginx的请求日志记录在根目录的logs下。

```
server {
    listen 80;
    server_name localhost;
    root www/;
    location / {
        index index.php index.html index.htm;
    }
    location ~ \.php$ {
        #php56
        fastcgi_pass 127.0.0.1:9000;
        #php73
        #fastcgi_pass 127.0.0.1:9001;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    access_log logs/access.log main;
}
```

- 3、启动成功后MySql的账号密码默认都是空，需要自行修改。

- 4、运行 “停止.bat” 脚本可停止所有服务，运行 “重启.bat” 可重启所有服务。

> 备注：
>
> 若启动失败，有可能是端口已被占用（php56:9000，php73:9001，mysql:3306，nginx:80），需要先关闭被占用的端口再重新启动。
>
> 可运行 “端口查看.bat” 脚本，然后输入要查询端口号，即可看到被占用端口的PID，然后再将其关闭

### Xdebug调试

已为PHP5.6和PHP7.3开启了Xdebug调试功能，可在对应版本的php.ini中查看或编辑Xdebug配置

### 更换php版本

若要新增或更换PHP版本，可在PHP官网下载自己想要的PHP版本，然后解压缩至php文件夹下，然后编辑 “开始.bat” 脚本，可参照php5.6将新的PHP版本绑定到指定的端口，然后在nginx配置文件中使用所绑定的端口即可
