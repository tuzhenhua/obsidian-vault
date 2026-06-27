---
tags: [技术, Obsidian, Claudian, 故障修复, Claude Code]
date: 2026-06-26
---

# Claudian 插件故障修复记录

## 时间线

### 阶段一：Claude Code 二进制找不到

**现象**：Claudian 报错 `Claude Code native binary not found at C:\Users\tuzhenhua\AppData\Roaming\npm\claude`

**根因**：配置文件 `cliPath` 指向了 npm 的 shell 包装脚本，不是真正的 `.exe` 二进制。

**定位**：
```powershell
where claude  # 确认已安装
# wrapper 脚本指向 node_modules/@anthropic-ai/claude-code/bin/claude.exe
```

**修复**：将 `.claudian/claudian-settings.json` 中的 `cliPath` 和 `cliPathsByHost` 改为真实 exe 路径：
```
C:\Users\tuzhenhua\AppData\Roaming\npm\node_modules\@anthropic-ai\claude-code\bin\claude.exe
```
结果：✅ 重启 Obsidian 后正常。

---

### 阶段二：插件启动不了

**现象**：Claudian 插件彻底无法启动。

**根因**：插件从 `claudian` 迁移到 `realclaudian`（v2.0.25），但缺少核心文件 `main.js`，目录下只剩空壳 `manifest.json` + `styles.css`。

**定位**：
```powershell
# .obsidian/plugins/realclaudian/ 只有 2 个文件
# 旧 claudian 目录已删除
# 配置文件 claudian-settings.json 也消失了
```

**修复步骤**：

1. 克隆源码仓库：
```powershell
git clone https://github.com/YishenTu/Claudian.git
```

2. 安装依赖并编译：
```powershell
cd Claudian
npm install
npm run build   # esbuild 编译出 main.js（4.1MB）
```

3. 拷贝三个文件到插件目录：
```
D:\屠振华\新知识和资料\.obsidian\plugins\realclaudian\
  ├── main.js          # 编译产物
  ├── manifest.json    # 插件声明
  └── styles.css       # 样式
```

4. 重建配置文件：
```
D:\屠振华\新知识和资料\.claudian\claudian-settings.json
```
填入正确的 `cliPath`（指向真实二进制）。

结果：✅ 插件恢复完整。

---

## 关键路径速查

| 项目 | 路径 |
|------|------|
| **插件目录** | `D:\屠振华\新知识和资料\.obsidian\plugins\realclaudian\` |
| **配置文件** | `D:\屠振华\新知识和资料\.claudian\claudian-settings.json` |
| **Claude Code 二进制** | `C:\Users\tuzhenhua\AppData\Roaming\npm\node_modules\@anthropic-ai\claude-code\bin\claude.exe` |
| **API 后端** | DeepSeek 中转（api.deepseek.com/anthropic） |
| **源码仓库** | `YishenTu/Claudian` |

---

## 踩坑点

1. **npm 全局安装的 `claude` 是 wrapper 脚本，不是原生二进制** — 必须指向 `node_modules/.../bin/claude.exe`。
2. **插件版本迁移不完整** — `claudian` → `realclaudian` 时文件没下全，只剩 manifest。
3. **国内网络限制** — GitHub Releases 直连和镜像都失败，只能走 `git clone` + 本地编译。

---

## 修复工具链（分层）

```
Obsidian GUI 聊天        🔴 塌了（插件缺失 main.js）
    ↓
VSCode 侧边栏           🔴 跟塌（同一个配置）
    ↓
终端 Claude CLI          🟢 活着（能用 CLI 修上面两层）
    ↓
Markdown 文件系统         🟢 从不塌（笔记一直在）
```

底层（终端 CLI + 文件系统）从未损坏。塌的只是 GUI 壳。

---

## 附：VSCode Claude 侧边栏图标不显示 — 排查手册

> 本次故障中，Obsidian Claudian 和 VSCode Claude 同时失效（同一个配置指向同一个二进制）。VSCode 侧边栏图标消失的排查，按以下顺序逐层定位——从壳到核，从最省力到最费力。

### 1. 检查扩展是否已安装并启用

- `Ctrl+Shift+X` 打开扩展面板
- 搜索 **Claude Code**，确认已安装且处于「已启用」状态
- 如果「已禁用」→ 点击启用
- 如果未安装 → 从 VS Code Marketplace 安装

### 2. 活动栏被隐藏

- 右键点击左侧活动栏区域 → 确认相关项未被取消勾选
- 或 `Ctrl+Shift+P` → 输入 `View: Toggle Activity Bar Visibility` → 确保活动栏可见

### 3. 图标被右键隐藏

- 左侧活动栏空白处右键 → 检查 **Claude Code** 前面是否勾选
- 未勾选 → 点击勾选恢复

### 4. 图标被拖到其他位置

- 活动栏图标可拖拽排序——检查是否被移到上方或下方
- 也可能被拖到了右侧边栏（Secondary Side Bar）

### 5. 扩展冲突或加载失败

```powershell
# 在 VS Code 终端中查看扩展状态
code --list-extensions | findstr claude
```

- `Ctrl+Shift+P` → `Developer: Reload Window` → 重新加载窗口
- 不行则完全卸载后重新安装扩展

### 6. 检查 VS Code 版本

- Claude Code 扩展需要 VS Code **1.82+**
- `Ctrl+Shift+P` → `Help: About` 查看版本
- 版本过低 → 更新 VS Code

---

> **手册用分层定位：先验证壳（安装/可见/勾选/位置）→再排查核（加载失败/版本冲突）。和主故障修复同一种操作。**
