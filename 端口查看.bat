@echo off
title �鿴ָ���˿��������
:find
echo.
set /p port=������˿ںţ�0~65535���鿴����������˳�������q��

::��ֵ����
if "%port%"=="" goto error_empty
if "%port%"=="q" goto end

cls
echo ָ���˿ڵ�ǰ�����
echo.
echo -------------------------------------------------------------------------------
echo   Э��   ���ص�ַ:�˿�          �ⲿ��ַ:�˿�          ״̬            PID

netstat -ano | findstr ".*:%port%\>"

::%port% ����Ķ˿ںţ�����ǰ���м�����һ��ð��
::\> �ֵĽ���������ƥ�����Ŀ�� :�˿ں� ����һ��û���ո񿪣��Ĳ��� :�˿ں� ��β�ģ���Ҫ������β��
::bug  [::1]:1900��һ�����ݴ���ƥ�䣡

goto find

:end
exit

:error_empty
cls
echo δ����˿ںţ�
echo
goto find