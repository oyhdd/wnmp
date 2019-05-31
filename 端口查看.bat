@echo off
title 查看指定端口连接情况
:find
echo.
set /p port=请输入端口号（0~65535）查看连接情况，退出请输入q：

::空值处理
if "%port%"=="" goto error_empty
if "%port%"=="q" goto end

cls
echo 指定端口当前活动连接
echo.
echo -------------------------------------------------------------------------------
echo   协议   本地地址:端口          外部地址:端口          状态            PID

netstat -ano | findstr ".*:%port%\>"

::%port% 输入的端口号，这里前面有加上了一个冒号
::\> 字的结束，这里匹配的项目是 :端口号 连在一起（没被空格开）的并以 :端口号 结尾的（不要求是行尾）
::bug  [::1]:1900这一类数据错误匹配！

goto find

:end
exit

:error_empty
cls
echo 未输入端口号！
echo
goto find