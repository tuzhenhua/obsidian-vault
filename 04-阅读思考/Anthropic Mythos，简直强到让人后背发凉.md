---
tags:
  - ai
  - security
  - vulnerability
  - mythos
  - anthropic
---

如果 AI Agent 只是“发现了一个 bug”，还不至于让人后背发凉。

但是 Mythos 真正让人不安的地方，是它已经开始接连触碰软件世界最硬、最深、最难啃的部分：操作系统内核、浏览器沙箱、OpenBSD 这种以安全著称的系统，以及 FreeBSD、FFmpeg 这类基础软件。

它不是在帮人写登录页，也不是在补一个普通脚本。它在读内核代码，找内存破坏，推演攻击路径，写 exploit，构造测试用例，最后把结果整理成可以交给厂商修复的报告。

这已经不是“AI 会写代码”。这是 AI 进入漏洞挖掘深水区。

先看苹果。

按照 9to5Mac 和 WSJ 转述的公开信息，Palo Alto 的安全公司 Calif 在测试 Claude Mythos Preview 时，用它辅助完成了一条 macOS 内核提权 exploit。Calif 后来补充说，这条攻击链不是 Mythos 单独完成的，仍然需要人类安全专家参与。

![文章首图](https://mmbiz.qpic.cn/mmbiz_png/P8sfvfG1sy8y7B11XZYicy4OeZ3aMQPM3WOzGcybvWxLnOCQmSaibECKEqM9FshDdR6FLWFtaMeqz7ibviaNvIwZWuNYhafT5tB5DQfUm2FIaTA/640?from=appmsg)

但时间线很刺眼：4 月 25 日发现 bug，5 月 1 日拿到 working exploit。几天时间，一条 macOS 内核提权链就被打了出来。

这条链路针对的是 macOS 26.4.1、M5 硬件、MIE 开启状态下的本地提权。MIE 是 Apple 用来压制内存破坏攻击的硬件辅助防线。Calif 的说法是，从一个普通本地用户出发，只用正常系统调用，最后拿到 root shell。

root shell 对普通用户可能只是两个英文单词。

对安全圈来说，这意味着系统权限的大门被打开了。

macOS 内核提权链

![macOS 内核提权链](https://mmbiz.qpic.cn/mmbiz_png/P8sfvfG1syib2lOgdCnvr6YiaXib6ibNYicmFPHycMIzuYUuias18Ed5G2fkBxEHicxlJLVBeViaCZMibQMZV9MuDpHXNuMXhfLoPUmVVMI68jxonZrA/640?from=appmsg)

  

苹果不是唯一案例。

Mozilla 在 5 月 7 日的复盘里说，他们用 Claude Mythos Preview 和其他 AI 模型，在 Firefox 里识别并修复了前所未有数量的潜在安全 bug。Firefox 150 里包含 271 个由 Claude Mythos Preview 找到的 bug；整个 4 月，Firefox 安全修复量冲到 423 个。

Mozilla 公开的小样本里，有 WebAssembly、XSLT、IPC race、IndexedDB refcount、sandbox escape。

这些都不是边角料。WebAssembly、IPC、沙箱逃逸，基本都是浏览器安全里最难啃的部分。

以前 AI 报安全 bug，经常被维护者当成噪音：看起来像漏洞，实际复现不了。Mozilla 这次看到的变化，是模型不只会说“这里可能有问题”，还能写测试用例，跑验证，把不可复现的猜测过滤掉。

漏洞挖掘最贵的地方，从来不是怀疑，而是证明。一个问题要能触发、能复现、能变成厂商愿意处理的报告，才算真正进入修复链路。

  

Firefox 安全验证链路

![Firefox 安全验证链路](https://mmbiz.qpic.cn/sz_mmbiz_png/P8sfvfG1syicf4icntczjdFb70IZbrOq6WZNXIq2B8oyKgic6DyBKMviab0hCldxl2pGNuB7Dpibpbukh98ygGqb8lkoBlWYyRxArQTwnXRqWhdY/640?from=appmsg)

  

Anthropic 在 Project Glasswing 里给出的判断更直接：Claude Mythos Preview 已经找到数千个高危漏洞，覆盖主要操作系统和主流浏览器。这个模型不会直接向公众开放。项目参与方包括 Apple、AWS、Google、Microsoft、NVIDIA、Palo Alto Networks、Linux Foundation 等。

官方红队报告里还有几组更扎眼的数字。

OpenBSD，被 Mythos 找到一个 27 年前的 TCP SACK 漏洞。OpenBSD 的标签一直是安全、保守、硬核，但这个漏洞能让远程攻击者反复打崩运行相关服务的机器。

FreeBSD，被 Mythos 找到一个 17 年前的 NFS 远程代码执行漏洞，CVE-2026-4747。Anthropic 称 Mythos Preview 完全自主地发现并利用了它。攻击者不需要认证，可以从互联网上拿到服务器控制权。

FFmpeg，也被翻出一个 16 年前的漏洞。自动化工具曾经打过几百万次相关路径，还是没抓出来。Mythos 把它找到了。

27 年。

17 年。

16 年。

这些 bug 不是昨天刚写进去的。它们已经跟着人类的软件系统跑了十几年、二十几年，穿过无数次编译、测试、审计、上线，最后被新一代 AI 模型重新翻出来。

  

多年旧漏洞被重新翻出

![多年旧漏洞被重新翻出](https://mmbiz.qpic.cn/mmbiz_png/P8sfvfG1sy9459q0oCJkCTNm11d8eKGY9XALRgDVBEV1t8Hm2esu4ZTNehDyPnKFKXcssPicsLaVnGIXO7auD1d7sOOvDDeqhW2yy0TP59ds/640?from=appmsg)

  

过去，顶级漏洞挖掘像手工艺。

安全研究员要懂系统、懂编译器、懂内存模型、懂历史包袱，还要在一堆看似正常的代码里找到那条细缝。

Mythos 还没有替代这些人。

苹果案例里，人类专家仍然关键。Calif 也承认，Mythos 发现已知类型的 bug 很快，但绕过 Apple MIE 这样的新防线，人类经验仍然重要。

真正改变速度的，是“高手 + AI”。

以前一个小团队要花很久才能啃下来的东西，现在可能被压到几天。以前需要集中很多人力才能过滤的安全疑点，现在模型能批量提出、构造、复现、筛掉噪音。

这也是 Anthropic 不把 Mythos Preview 直接开放给公众的原因。

它不是一个更会写代码的 Claude。

它更像一台软件考古机，把基础软件里埋了十几年、二十几年的旧伤口，一层一层翻出来。

对防守方来说，这是好消息。越早发现，越早修。

但同一套能力如果扩散到攻击侧，压力会直接回到每一个软件系统身上。

鬼知道系统的哪个 bug正在被AI利用着而我们却浑然不知呢。
