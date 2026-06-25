# 4 个无显卡也能跑的 AI 模型

原创 黑虾 黑虾 黑虾

_2026年6月8日 12:43_ _广东_ 1人

在小说阅读器读本章

去阅读

在小说阅读器中沉浸阅读

其中有清华系团队，做的一个 1B 的模型，综合评测，把所有同尺寸，国内外开源模型都打败了，差距还不小。而且是家里老电脑，办公用台式机、轻薄笔记本都可以跑的模型。

---

# 一、Qwen3.5-0.8B

发布时间：2026年2月（阿里千问）

Q4量化内存占用：约500MB；上下文：262K token

【简评】：入门推荐，门槛极低。笔者用一台2021年的AMD 5600G核显机（没有独显）实测，输出速度33 tok/s，打字速度根本跟不上它输出的速度。0.8B的体积，决定了智力上限不高，复杂推理、长文写作指望不上。这个体积的模型，比较适合用来学本地部署流程。

## 适用场景：

学习本地部署流程

老电脑/核显机验证能不能跑

简单问答、短文本处理

---

# 二、MiniCPM5-1B

发布时间：2026年5月（OpenBMB，清华系）

Q4量化内存占用：约700MB；上下文：131K token

【简评】：1B参数里综合评测目前最强的一个，没有之一。BenchLM综合评分42.57，把同尺寸其他开源模型（最高35.61）甩出一大截。OpenBMB是清华系团队，他们做的MiniCPM系列一直有个特点：拼了命把小模型做聪明，现在已经是第5代了，把1B的模型，能做到这个水平，非常牛X。

![图片](https://mmbiz.qpic.cn/mmbiz_png/wpWkzRiaicjvmkttQCMe8rRLXT6vVCnNfdZx1NZNJibIWT4jmVW7DRmJicNvCVrQ6ibR7icOw2KfxqibAaKjRSsEkhiaib64dkSXtKDwFnRB0TjDLhxA/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1&watermark=1#imgIndex=0)

擅长推理、代码、Agent工具调用。中文也很好，毕竟国内团队做的。

## 适用场景：

需要有推理能力的轻量助手

代码补全

OCR图片文字识别提取

---

# 三、LFM2.5-1.2B

发布时间：2026年1月（Liquid AI）

Q4量化内存占用：不到1GB；上下文：32K token

【简评】：Liquid AI是一家做非Transformer架构的AI公司，LFM系列用的是自研的液态神经网络（Liquid Neural Network），不是标准Transformer，推理时状态更紧凑、内存读取效率更高，所以输出速度非常快。官方有提供GGUF文件，llama.cpp和LM Studio都支持，部署方法和普通模型没区别。

缺点是中文能力有限，以英文任务为主，另外32K上下文偏短，长文档不太行。

## 适用场景

对速度极度敏感、不愿等的场景

英文内容处理

低配设备（内存只有8GB也完全没问题）

---

# 四、Gemma4-E2B

发布时间：2026年4月（Google DeepMind）

Q4量化内存占用：约1.5GB；上下文：32K token

【简评】：谷歌Gemma4系列里最小的多模态版本，有效参数2B，优化极其细致，这个模型可以在手机上离线跑，推理效率很高。实测了一下，手机上输出还挺快的。问了个香港旅游攻略，回复的还挺像那么回事，不算完全弱智了。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wpWkzRiaicjvmERjJkfFPJocACgtWofiaIDTjsRQvboZp0IG9a7jvibSHpwsupaY0X4LDxlXfK5vMv9JZsY12SXC4A6uCND4mJQ5h7ruHfjrQKE/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1&watermark=1#imgIndex=1)

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/wpWkzRiaicjvkU6ssnQQ4Jev0T8bEzic6wke6IhzVWGOlr5pPmxaI5vQVEMXYc0jTc3Ticl10tHXtah3CibVXFQWjOQ24WkEvG3fYwvSxPicp07N4/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1&watermark=1#imgIndex=2)

## 适用场景：

图片理解、截图解读、表格提问

低内存设备（8GB足够）

英文为主的多模态任务

---

# 无显卡能跑模型对照表

|模型|参数量|Q4内存|中文能力|一句话定位|
|---|---|---|---|---|
|LFM2.5-1.2B|1.2B|730MB|一般|CPU速度最快，英文任务|
|Qwen3.5-0.8B|0.8B|740MB|基础|学本地部署，老电脑首选|
|MiniCPM5-1B|1B|700MB|还不错|1B里最聪明，有推理模式|
|Gemma4-E2B|5B|~4.4GB|一般|支持图片输入，英文很强|

---

以上，希望对你有帮助。

本文长期更新，有新的模型发布笔者会持续补充。欢迎点赞、关注和收藏。

如果想了解更多AI大模型本地部署，可以关注我