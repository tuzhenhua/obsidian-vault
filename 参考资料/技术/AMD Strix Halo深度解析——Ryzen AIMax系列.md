---
tags:
  - 技术
  - 硬件
  - AMD
  - Strix Halo
  - AI
  - 边缘计算
date: 2026-02-23
source: reference
related:
  - "[[参考资料/技术/AMD Strix Halo——掌上本地大模型.md]]"
  - "[[个人回忆/自我分析/边缘计算——我的位置.md]]"
---
# AMD Strix Halo 深度解析：Ryzen AI Max 系列，移动端”独显级”芯片真的到来了

By [sora](https://sorabin.com/author/infosorabin-com/ "View all posts by sora") / February 23, 2026 

芯片与处理器

AMD 的 Strix Halo 架构——也就是官方命名的 **Ryzen AI Max 系列**——是 2025 年最重要的 [芯片](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)发布之一。它不是一块普通的 [处理器](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)更新，而是一次架构层面的激进尝试：在一颗移动端 SoC 里塞进多达 **40 个计算单元（CU）的 RDNA 3.5 核显**，统一 [内存](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)最高支持 128GB LPDDR5X，让笔记本芯片首次具备接近独立显卡的图形性能。

## [Strix Halo](https://amzn.to/4tN6IeZ) 是什么？和普通 Ryzen 有什么不同

先把命名理清楚：

- **Strix Halo** = 芯片的微架构代号（AMD 内部使用）
- **Ryzen AI Max 系列** = 面向消费者的产品名（Ryzen AI Max 385 / AI Max 390 / AI Max 395）
- **Ryzen AI 300 系列（Strix Point）** = 不同的产品线，核显只有 16 CU，不要混淆

Strix Halo 的核心差异在于**核显规模**。过去的移动端 APU，核显最多 12-16 个 CU，性能远低于独立显卡。Strix Halo 直接拉到 40 CU（最高型号），相当于 AMD RX 7600M 级别的独显性能塞进了一颗 SoC——这在移动端是前所未有的。

CPU

|规格|Ryzen AI Max 395|Ryzen AI Max 390|Ryzen AI Max 385|
|---|---|---|---|
|CPU 核心数|16 核（12P+4E）|16 核（12P+4E）|12 核（8P+4E）|
|核显 CU 数|40 CU|32 CU|32 CU|
|最大内存|128GB LPDDR5X|128GB LPDDR5X|96GB LPDDR5X|
|NPU 算力|50 TOPS|50 TOPS|50 TOPS|
|TDP 范围|15-120W|15-120W|15-120W|

宽泛的 15-120W TDP 范围意味着整机厂商有很大的调校空间——同样是 Ryzen AI Max 395，在 45W 模式下和 120W 模式下的性能差别极大。

## 核显性能：真的能替代独立显卡吗？

这是大家最关心的问题。直接看实测数据。

机器学习与人工智能

**图形性能（Ryzen AI Max 395，45-55W 配置）：**

- 3DMark Time Spy：约 7000-8500 分（对比：RTX 4060  [Laptop](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#) 约 8000-9000 分）
- 《赛博朋克 2077》1080p 高画质：约 40-55 帧
- 《艾尔登法环》1080p 高画质：约 50-60 帧
- 《博德之门 3》1080p 超高画质：约 45-60 帧

在 45W 左右的 [笔记本](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)模式下，Ryzen AI Max 395 的核显性能可以达到接近 RTX 4060 Laptop 的水平。在一些对 VRAM 带宽敏感的任务上（比如本地 AI 推理），得益于超高带宽的统一 [内存](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)，Strix Halo 甚至能超越 RTX 4060。

但如果搭载它的设备允许更高 TDP（比如迷你主机），性能上限还会进一步提升。

## 统一内存：为什么高带宽内存是关键

Strix Halo 的另一个设计重点是**统一内存架构**：CPU、GPU 和 NPU 共享同一块高带宽内存池，无需数据在 CPU 内存和显存之间来回复制。

电子元件

- 内存带宽：256-bit LPDDR5X，峰值约 **273 GB/s**（对比：RTX 4060 Laptop 的 GDDR6 带宽约 256 GB/s）
- 最大支持容量：**128GB**（Ryzen AI Max 395 / 390）

128GB 统一内存对于本地大模型推理来说意义重大。Llama 3 70B（Q4 量化版约需 40GB）、某些多模态大模型，都可以完整加载到内存中，不需要云端推理。这是目前市面上基于 Windows 的移动端 AI SoC 里内存容量最大的选择。

## 搭载 Strix Halo 的设备有哪些？

目前已上市或即将上市的 Strix Halo 设备覆盖了多个品类：

**笔记本电脑：**

- **ASUS ProArt PX13**：13 英寸创作本，Ryzen AI Max 390，配 OLED 屏，约 2199 美元
- **ASUS ROG Flow Z13 2025 Pro**：Windows 游戏平板，Ryzen AI Max 395，约 1599 美元起
- **Razer Blade 14 2025**（部分版本配置 Strix Halo）
- **HP OmniBook Ultra 14**：轻薄商务本，Ryzen AI Max 365，重量约 1.4kg，约 1699 美元
- **Lenovo ThinkPad X1 Carbon Gen 14**（部分 Strix Halo 配置）

芯片与处理器

**迷你主机 / 工作站：**

- **Minisforum BD395i MAX 主板**：Mini-ITX 板型，内置 Ryzen AI Max 395，PCIe 5.0 x16 插槽，适合 DIY 用户。关于 Minisforum 完整产品线，可参考我们的 [Minisforum 迷你PC 选购指南](https://sorabin.com/minisforum-mini-pc-buying-guide-2025-2026/)。
- **GMKtec EVO X2**：迷你主机，Ryzen AI Max 395，约 1099 美元，支持最高 96GB  [内存](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)
- **AYANEO NEXT 2**：掌机，Ryzen AI Max 395，1799-3499 美元
- **OneXPlayer G1 Pro**：掌机，Ryzen AI Max 395

## Strix Halo vs 竞品：该怎么选

### 对比 Intel Core Ultra 200HX（Arrow Lake-HX）

Intel 的 Arrow Lake-HX 仍然需要搭配独立 [显卡](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)才能获得高性能图形，核显（Arc 系列集成版）性能远不及 Strix Halo。优势在于游戏兼容性（x86 生态更成熟）、PCIe 通道数、搭配高端独显的整体性能上限更高。

Strix Halo 适合：不想要独立显卡的重量和功耗，但又需要相近图形性能的场景。

内存

### 对比 Apple M4 Pro / M4 Max

苹果 M4 Max 是 Strix Halo 最直接的竞争对手——同样是统一内存架构，同样强调高带宽和 AI 性能。M4 Max 的 GPU 性能（40 核版本）在很多测试里略强于 Ryzen AI Max 395，功耗控制和续航也更好。

代价是 macOS 生态：如果你的工作流高度依赖 Windows 应用，M4 Max 的优势打了折扣。Strix Halo 提供了在 Windows 生态内最接近”Mac 统一内存体验”的选择。

### 对比 Snapdragon X Elite

Snapdragon X Elite 的优势在于超长续航（15 小时+）和更低整机功耗，适合商务出行场景。但 Adreno GPU 的图形性能和 Strix Halo 的 RDNA 3.5 核显不在同一量级——Strix Halo 的游戏和图形性能大约是 Snapdragon X Elite 的 2-3 倍。详细的 Snapdragon X Elite 分析可以参考我们的 [Snapdragon X Elite 性能测试](https://sorabin.com/snapdragon-x-elite-ai-pc-performance-test/)文章。

## AI 推理性能：本地大模型的实用性

Strix Halo 的 50 TOPS NPU（XDNA 2 架构）搭配大容量统一 [内存](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)，是目前 Windows 平台本地 AI 推理体验最好的移动端方案之一。

笔记本电脑

实测参考：

- **Llama 3.1 8B**（Q4 量化）：生成速度约 70-90 tokens/秒，优于带 VRAM 限制的 RTX 4060  [Laptop](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)
- **Mistral 7B**：约 80-100 tokens/秒
- **Qwen2.5 72B**（Q4 量化，需约 45GB 内存）：约 10-15 tokens/秒，能跑、但慢

对于想在本地跑大语言模型的开发者和研究者，128GB 内存选项是目前移动端最大的统一内存容量，和 Mac Studio M2 Ultra 的水平相当。

## 值不值得买？

**适合 Strix Halo 的用户：**

- 需要高图形性能但不想要独立 [显卡](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)的重量和散热
- 本地 AI 推理（尤其是大模型，需要大内存）
- 创意工作者（渲染、视频剪辑、Stable Diffusion）
- 希望在 Windows 生态内体验统一内存架构

显卡、图形卡

**不适合 Strix Halo 的用户：**

- 主要用途是 3A 游戏且追求最高帧数：RTX 5070/5080 Laptop 独显在高画质 1440p/4K 下仍然领先
- 极度注重续航：统一内存和高性能核显在满载下功耗可观，游戏续航通常只有 1.5-2.5 小时
- 预算有限：搭载 Strix Halo 的设备普遍在 1000 美元以上

AMD Strix Halo（Ryzen AI Max 系列）代表着移动端 APU 技术的一个重要里程碑：40 CU RDNA 3.5 核显加上最高 128GB 高带宽统一内存，让”无独显笔记本也能跑高负载图形任务”从概念变成了现实。它不能完全替代独显，但在 45-55W 的笔记本功耗范围内，已经非常接近入门级独显的性能区间。

对于需要 AI 推理、本地大模型、专业创作且偏爱 Windows 生态的用户，Strix Halo 是目前最值得关注的移动端 [芯片](https://sorabin.com/amd-strix-halo-ryzen-ai-max-deep-dive/#)选择。