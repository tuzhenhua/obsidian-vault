---
source: reference
---

# Win11 自带组件优化清单

来源：掌中IT发烧友圈（2026.06.13）

## 可卸载/禁用的5个组件

### 1. OneDrive
- 永久卸载：用开源工具 GoW 强制卸载（有推广嫌疑，慎用）
- 保守操作：设置 → 关闭「开机自动启动」

### 2. Cortana 小娜
管理员身份打开 PowerShell，运行：
```
Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage
```

### 3. Xbox Game Bar（非游戏用户）
设置 → 游戏 → Xbox Game Bar → 关闭所有开关
顺手关掉「游戏模式」

### 4. 照片APP 后台自动扫描
管理员身份打开 PowerShell，运行：
```
Get-AppxPackage *photos* | Remove-AppxPackage
```
或用 ImageGlass 替代（极简看图工具）

### 5. 右键菜单常驻进程
Ctrl+Shift+Esc 打开任务管理器 → 启动应用 → 禁用所有 Intel、Realtek、Conexant 字样的启动项

> ⚠️ 以上操作不影响系统稳定性和核心功能。注册表操作有风险，不建议小白尝试。
