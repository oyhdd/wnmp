# wnmp

一键搭建PHP运行环境，基于 windows + nginx + php + mysql，无需安装，一键启动、停止和重启

#### 介绍

由于windows的php集成开发环境几乎都是Apache + php + mysql，每次想使用nginx时都需要单独配置，比较麻烦，于是便集成了wnmp开发环境，并且可通过bat脚本一键启动、停止和重启。

#### 使用说明

- 1、将项目解压后可放置于自定义的位置，然后运行 “开始.bat” 脚本即可一键启动nginx、php和mysql，并自动打开127.0.0.1的网页。

- 2、自己的项目代码放置在根目录的www目录下，然后可在nginx/conf/vhost/ 文件夹下添加自己的nginx配置文件，nginx的请求日志记录在根目录的logs下。

- 3、启动成功后mysql的账号密码默认都是空，需要自行修改。

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
        #php71
        #fastcgi_pass 127.0.0.1:9001;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
    access_log logs/access.log main;
}
```

> 备注：

>若启动失败，有可能是端口已被占用（php56:9000，php71:9001，mysql:3306，nginx:80），需要先关闭被占用的端口再重新启动。

>可运行 “端口查看.bat” 脚本，然后输入要查询端口号，即可看到被占用端口的PID，然后再将其关闭


### 更换php版本

若要新增或更换php版本，可在PHP官网下载自己想要的php版本，然后解压缩至php文件夹下，然后编辑 “开始.bat” 脚本，可参照php5将新的php版本绑定到指定的端口，然后在nginx配置文件中使用所绑定的端口即可