---
title: Ubuntu Snap Devpacks ——便利与自由的裂缝
source: 公众号"非理性的程序员" / 叔本蓝
original: 《35 Years of Linux Principles. Ubuntu Just Threw Them Away in One Snap.》— Can Artuc (Medium)
date: 2026-06-05
tags: [转载, Linux, Ubuntu, Snap, 开源, 技术评论]
---

# Ubuntu Snap Devpacks ——便利与自由的裂缝

> 转载自公众号"非理性的程序员"，原文作者 Can Artuc，源自 Medium

---

## 事件

2026年4月22日，Ubuntu 26.04 LTS "Resolute Raccoon" 发布前一天，Canonical 发布了一篇博客，藏在其中的 Snap Devpacks 路线图悄然改变了 Ubuntu 作为开发者机器的意义。

`devpack-for-spring`、`devpack-for-go`、.NET snap 包已上线，Rust、C/C++、Python 紧随其后。每条命令都跑在 Canonical 的私有服务器上，由一家公司签署每一个包。

---

## 一条命令，四合一

`sudo snap install devpack-for-spring --classic`

这一条命令做了四件事：
1. 安装一组 APT 和 Snap 包（可配置）
2. 通过 Spring Boot 初始化器创建新项目
3. 管理 Spring 项目库，支持 Maven/Gradle，可离线安装
4. 附带两个插件：代码格式化 + OCI 镜像构建（不用打开 Dockerfile）

结果：从零到跑起 Spring Boot 服务，只需一条命令。这是 Linux 有史以来最快的开发环境搭建方案。

---

## 核心争议：便利 vs 自由

**便利的一面：**
- 跟苹果 Xcode、微软 Visual Studio 一样的捆绑模式
- 新员工入职配置从一周缩短到一个上午
- Linux 在开发者体验上输给 macOS 二十年，这是第一次有追上来的可能

**自由的一面：**
- Snap 商店无法复刻，服务端闭源，无法自建
- 每个包都由 Canonical 签名，供应链完全依赖一家公司
- 你无法像复刻 Flathub 或运行自己 Nix 缓存那样去独立运作
- "企业商店"只是本地代理缓存，不是独立的注册中心

> "在 macOS 和 Windows 上，这本来就是默认的游戏规则。而在 Linux 上，从来不是，直到现在。"

---

## 替代方案

文章提到的替代方案：

| 方案 | 特点 |
|------|------|
| **mise** | 多语言版本管理器，Rust 编写，单一 `.mise.toml` 文件锁定版本 |
| **Nix devShells** | 可复现开发环境，`flake.nix` 锁定工具链，字节级一致 |
| **Fedora COPR** | 社区构建包仓库，标准 DNF 结构，可镜像 |
| **容器** | Dockerfile/Podman，OCI 规范保证可移植性 |

---

## 我的看法

> 便利 vs 自由，不应该是二选一的问题，而是**这条线划在哪里**的问题。

Canonical 的问题是拿一个方案吃所有人。Ubuntu 就该有三个版本：

- **Ubuntu Classic（自由版）** — 传统 apt，不去中心化信仰，底层必须自己可控
- **Ubuntu Dev（便利版）** — Snap Devpacks 一条命令配好工具链，给"只想把代码跑起来"的人
- **Ubuntu Core（边缘版）** — 最小化系统，纯 Snap，针对物联网/嵌入式（这个已经存在）

不同的节点用不同的配置——这本来就是边缘计算的核心逻辑。一个方案吃所有人，既要又要才最拧巴。

> 2026-06-07 读后记
