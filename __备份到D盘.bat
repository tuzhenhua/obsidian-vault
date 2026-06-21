@echo off
title Obsidian Vault Backup

echo ====================================
echo   Obsidian Vault - Backup to D:
echo ====================================
echo.
echo Source: C:\Users\Lenovo\Documents\Obsidian Vault
echo Target: D:\Obsidian_Vault_Backup
echo.
echo Syncing, please wait...
echo.

robocopy "C:\Users\Lenovo\Documents\Obsidian Vault" "D:\Obsidian_Vault_Backup" /MIR /R:2 /W:3 /NDL /NP

echo.
echo ====================================
echo   Backup Complete!
echo   Press any key to exit
echo ====================================
pause >nul
