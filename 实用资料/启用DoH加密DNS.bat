@echo off
title 启用 DoH 加密 DNS
color 0A

echo ==============================================
echo     Windows 11 DoH 加密 DNS 一键配置工具
echo ==============================================
echo.
echo  本脚本将自动完成以下操作：
echo    1. 开启系统全局 DoH / DoT 加密开关
echo    2. 添加腾讯 DNS（主）
echo    3. 添加阿里 DNS（备）
echo    4. 显示当前加密 DNS 状态
echo.
echo ==============================================

:: 检查管理员权限
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] 请右键本脚本，选择"以管理员身份运行"！
    echo.
    pause
    exit /b 1
)

echo [INFO] 管理员权限验证通过
echo.

:: 第 1 步：开启全局加密开关
echo [1/4] 正在开启系统全局加密开关...
netsh dns set global doh=enabled >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] DoH 全局开关已开启
) else (
    echo       [WARN] DoH 开启失败，请检查系统版本是否为 Win11 21H2+
)

netsh dns set global dot=enabled >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] DoT 全局开关已开启
) else (
    echo       [WARN] DoT 开启失败
)
echo.

:: 第 2 步：添加腾讯 DNS
echo [2/4] 正在添加腾讯 DNS（主）...
netsh dns add encryption 183.60.83.19 "https://doh.pub/dns-query" >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] 腾讯 DNS 已添加 (183.60.83.19)
) else (
    echo       [INFO] 腾讯 DNS 可能已存在，跳过
)
echo.

:: 第 3 步：添加阿里 DNS
echo [3/4] 正在添加阿里 DNS（备）...
netsh dns add encryption 223.5.5.5 "https://dns.alidns.com/dns-query" >nul 2>&1
if %errorlevel% equ 0 (
    echo       [OK] 阿里 DNS 已添加 (223.5.5.5)
) else (
    echo       [INFO] 阿里 DNS 可能已存在，跳过
)
echo.

:: 第 4 步：显示当前状态
echo [4/4] 正在获取当前加密 DNS 状态...
echo.
echo ==============================================
echo    当前 DoH 全局设置
echo ==============================================
netsh dns show global
echo.
echo ==============================================
echo    已注册的加密 DNS 服务器
echo ==============================================
netsh dns show encryption
echo.
echo ==============================================
echo    脚本执行完毕！
echo ==============================================
echo.
echo  ⚠️  请手动完成以下步骤（必须！）：
echo.
echo    【Wi-Fi 用户】
echo    设置 ^> 网络和 Internet ^> Wi-Fi ^> 你的WiFi名
echo    ^> 查看其他属性 ^> DNS 服务器分配 ^> 编辑
echo    ^> 手动 ^> 首选 DNS: 183.60.83.19
echo               备用 DNS: 223.5.5.5
echo    ^> 保存
echo.
echo    【以太网用户】
echo    设置 ^> 网络和 Internet ^> 以太网
echo    ^> （同上操作）
echo.
echo   完成后断开重连网络即可生效。
echo   验证地址：https://1.1.1.1/help
echo.
echo ==============================================
pause
