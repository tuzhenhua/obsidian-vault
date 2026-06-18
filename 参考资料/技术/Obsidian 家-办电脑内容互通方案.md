---
tags:
  - obsidian
  - 工具
  - git
created: 2026-05-31
source: reference
---

# Obsidian 家里 ↔ 办公电脑内容互通方案

## 问题

Obsidian 的数据就是本地一个文件夹（Vault）。家里电脑一套，办公电脑一套，怎么让两边的内容保持一致？

## 三种方案对比

| | Git + GitHub | Obsidian Sync | 云盘同步 |
|---|---|---|---|
| **费用** | 免费 | $5/月 | 免费 |
| **难度** | 中等（需配 Git） | 零配置 | 零配置 |
| **可靠性** | 高，不会丢数据 | 最高，增量同步+加密 | 中等，偶有冲突文件 |
| **手机端** | 需第三方 App | 支持 | 看云盘 |
| **隐私** | 走 GitHub（建议私有仓库） | 端到端加密 | 看云盘服务商 |

---

## 方案一：Git + GitHub 私有仓库（⭐ 推荐）

适合已经会用 Git 的人，零成本、完全可控。

### 1. 建 GitHub 私有仓库

- 新建仓库 → **必须选 Private**（笔记涉及隐私）
- 不勾 "Add README"

### 2. 家里电脑——首次推送

```bash
cd "你的 Obsidian Vault 目录"
git init
git remote add origin https://github.com/你的用户名/仓库名.git
git add -A
git commit -m "初始同步"
git push -u origin main
```

### 3. 办公电脑——首次拉取

```bash
git clone https://github.com/你的用户名/仓库名.git "你的 Vault 路径"
```

然后在 Obsidian 里打开这个文件夹。

### 4. 日常使用

```bash
# 写完笔记
git add -A && git commit -m "更新" && git push

# 换电脑后
git pull
```

### 5. 自动化：装 Obsidian Git 插件

社区插件搜 **"Obsidian Git"**，设置自动 commit + push + pull 间隔（如每 10 分钟），完全不用手动敲命令。

### 6. .gitignore 配置（重要）

`.obsidian/` 里有些配置应该同步，有些不应该（两台电脑屏幕不同、主题偏好不同）：

```
# 忽略整个 .obsidian/
.obsidian/

# 但这些应该共享
!.obsidian/app.json
!.obsidian/community-plugins.json
!.obsidian/core-plugins.json
!.obsidian/plugins/

# 以下每台机器不同，保持忽略
# workspace.json    → 窗口布局
# appearance.json   → 主题字体
```

---

## 方案二：Obsidian Sync（官方）

设置 → 核心插件 → 同步，登录账号即可。

- ✅ 增量同步，速度快
- ✅ 端到端加密
- ✅ 实时同步，不用手动操作
- ✅ 有版本历史，误删可恢复
- ❌ $5/月

适合不想折腾、数据敏感的场合。

---

## 方案三：云盘同步

把 Vault 放在 OneDrive / iCloud 目录下。

- ✅ 零配置
- ❌ 偶尔出现 `文件名-冲突.md`，需手动处理
- ❌ `.obsidian` 配置可能互相覆盖
- ❌ 手机端支持不稳定

适合对可靠性要求不高的轻量使用。

---

## 总结建议

| 你的情况 | 推荐方案 |
|----------|----------|
| 会用 Git | 方案一（免费 + 完全可控） |
| 不想折腾 | 方案二（付费但省心） |
| 轻度使用 | 方案三（简单粗暴） |

我自己选了方案一，`.gitignore` 已配好，装个 Obsidian Git 插件，两边自动同步。写完这段笔记，它就自己推到 GitHub 上了。
