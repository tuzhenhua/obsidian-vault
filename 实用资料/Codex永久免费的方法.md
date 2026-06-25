---
tags:
  - Codex
  - Codex++
  - Agnes
  - AI
  - 实用
date: 2026-06-23
source: reference
---

# Codex永久免费的方法，好像真让我发现了

原创 路人甲TM 路人甲TM 路人甲TM

_2026年6月23日 17:30_ _江苏_ 7人

在小说阅读器读本章

去阅读

在小说阅读器中沉浸阅读

说个我自己都没料到的事，Codex现在能完全免费用了。

而且是个能长期用的法子，文本、图像、视频全都包。方法我前前后后折腾过几遍，能稳定接上，今天就把它拆开讲给你。  

核心思路特别简单，把Codex背后的模型，换成一个能力在线、又长期免费的大模型，Agnes。

这名字你可能没听过，我之前也完全没印象。

后来扒了一下才知道，是家挺低调的新加坡公司。官方说它是全球TOP10的AI实验室，文本、图像、视频三块都排在前面。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/oUIVtxx3RervuS8HnOrdH8mwCo1iclXRGxdE7c2sibBpBuUu5Mt1IQEYKfspEI5pstekKbkMatVsZWaNwvU6mOeSg3JicwK2xZtn9yKPsmT6RA/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=0)

我花了点时间琢磨，成功把它接进Codex了。

之前不少人遇到的，接别的模型后插件全没了的问题，这次也能绕开。接完之后，Codex的插件、Skill、聊天记录，全都还在。

整套流程只用到一个工具，Codex++。中间有几个容易踩的坑，我边讲边提。

**第一步，先把Codex装好**

已经装过的可以跳过这步，只要把Codex彻底退出就行。

还没装的话，直接搜索Codex官网，挑适配你电脑的版本下载。

用免费API登录还有个附带的好处，门槛降下来了。

以前登Codex得手机号验证，或者充个Pro才进得去，现在连OpenAI账号都可以不用。

装好以后先打开Codex，会蹦出登录界面，别管它，直接关掉，然后把Codex完全退干净。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/oUIVtxx3ReoA5fjWOu7KqHgCdAiaxaaYJibib2quG5DYsnhbTcDPGCAavasOgnlAN7N03JEMLOs071hUiaRVIbHbwwZWDluuAEoKDxKmVfKmThw/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=1)

**第二步，装Codex++**

下载地址在这

https://github.com/BigPizzaV3/CodexPlusPlus/releases

Mac用户如果打开报错，终端里输入这两行

```
sudo xattr -rd com.apple.quarantine "/Applications/Codex++.app"
```

这一步是在解除macOS的安全隔离，对没签名的第三方应用是常规操作，知道自己在干嘛就行

下完你会看到两个东西，Codex++和Codex++管理工具，两个都需要装上，后面会讲分别怎么用。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3ReqmIwt9Man608V7ZsHwrVzPhekVDCcLDRGdr4RNmFjBebyArFUVXp8dNuR4Ao7eONsXzZng39Zfe85bt0pooCxsMmnsOtWzkF8/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=2)

**第三步，拿到Agnes的****API** **Key**

打开官网

https://agnes-ai.com/

先注册个账号，进控制台，找到API Key那一栏。新建一个Key，复制好存下来，待会儿要填。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3Reoo6H159MpmOX2uNOvjCmxNSyOLF8U71Q6pCrdGXGjqkjUPbw3pPmOa8oqtHeW4LEKKPkEqJ7EWmumPZVuibgTex4GhiaXVTZKyI/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=3)

**最后一步，把Agnes接进来**

打开Codex++管理工具，点左边的供应商配置，选添加供应商。

供应商名称，写Agnes。接入模型，选纯API。模型配置，填agnes-2.0-flash。

Base URL填这行

https://apihub.agnes-ai.com/v1

Key填刚才复制那串，模式选Chat。

然后点从上游获取，正常的话会拉到五个模型。填完记得保存。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/oUIVtxx3RepQJXTdaRyWs8JjaBzB9bY3ZZuCicNicFQzPsO1KzgflxADuGds8hMcmF9rXznu1XmKaF8TRJzeibVZibzbVNpTous7TgsIwURhcAM/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=4)

接下来这步是关键。

配完之后，选中这个模型，点右上角的重启Codex++。

这个重启Codex++，等于帮你双击了一下Codex++这个工具本身，省得你再切回去手动双击。

再梳理一下流程。

换模型之前，先把Codex彻底退掉。

打开Codex++管理工具，选好模型配置。

点右上角重启Codex++，或者直接双击Codex++。

一定要注意，这里是双击Codex++，别自己手动去开Codex，不然接不进去。

因为手动开的是官方那个Codex，走的是官方登录态，自然读不到你刚配的API。得让Codex++来拉起Codex，配置才会注入进去。

**看看效果如何**

打开Codex，能看到用API成功登上了。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/oUIVtxx3Reo5pOoawm45GetUXCE4zEUUPjiaKlIQVNhyC4AntrNmTPic0icljHfjyy8ehaJjh53lpbnicRcp5lwOJria8zIzz2TBjlZaoSibR1g7c/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=5)

先随手测一句，问它今天几号。答对了，说明模型这边通了。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3ReosY5A8HTW065sQeJuHIjIBxnsWR2gJPlUc6FVpNQq6xiczIDZv4XPs9bkarB39IBHBnLQ1eQr0ZlaZlb0JhhRsXuWL7E5Gyzws/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=6)

再让它在桌面建个文件夹，也建出来了，说明调本地工具这条路也通。

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/oUIVtxx3Rerp3GB55RGhvn5NZu5AnB9ibicU7bOH29CF09PgUic4FoxY0eVfOXqu4j1SXK8cawtFibXD6eYAmWRKt3GFnkH0VEHabbocCxY2ianY/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=7)

再检查一下插件，搜个hyper frames，该有的都在，跟用GPT登录时一模一样。之前接别的模型把插件弄没了的，也能在Codex里重新填一遍API Key找回来。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3Reo5Z6z7jJWRXHL5aNLcb8J6hdqHCuABPqDBdvaJf46W1QSMCWnxicH40jZJnhMe4vBOAfOYoib6VUwOHhBlQPXT54cSvAibG3wibiao/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=8)

之前的Skill也能照常调用。下次再切回这个模型，原来的聊天记录也都给你留着。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3RepHQwKSNW2QVIwQRpLt1Gsl5vDUUSNWhlYuoxh9nXZE0L48EwGJp2k1Ticdkg9WiahUsf7iavnj9IMibWh8dOnGcfnYdMnethsh5mU/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=9)

右下角你会看到有图像、视频模型，但这俩在这儿点不动。

原因是Agnes确实有生图生视频的能力，可它对外只给OpenAI Chat Completions兼容的接口，图像和视频走的是另一套，靠切模型或者直接对话都唤不出来，得用Skill去调API。

简单点的玩法，是让另一个本地跑着的Agent帮你把Skill装好、把API Key写进去。我就让Claude Code帮我装了个生图的Skill，简单试了试，出图挺快，效果也还行。

![图片](https://mmbiz.qpic.cn/mmbiz_png/oUIVtxx3Req2XvK8fI27pYOBpHfqAJqwFZzOvytZMRV04EKrlSTuSicx9M1lrHTXZIgfSwfKNFIzXDabM8Qu3KMf7zIEvrTSpdjBEqNyx9DA/640?wx_fmt=png&from=appmsg&tp=wxpic&wxfrom=5&wx_lazy=1#imgIndex=10)

再说下限制。

Agnes免费版现在主要卡的是速率，每分钟最多调20次，应付日常基本够用了。

官方在推1M的超长上下文，但1M上下文和4K图片这两块不会一次性全放开，是分批灰度的，接下来几天会陆续覆盖到所有人。

**最后想说的话**

Agnes 官方文档里有句话，我看到的时候很受触动：

要让世界级的人工智能属于每个人。

世界级的智能，不该只握在少数大机构手里，而应该成为每一个开发者使用、每一个产品实现集成、每一个用户实现受益的基础能力。

至于免费能撑多久，谁也说不准。

但有件事我越来越确定。

工具越是强大，普通人就越需要找到自己不可被替代的东西。

这点东西，就是给自己挖的护城河。

我是路人甲，前数据分析、产品人，现创业者。关注 AIGC 人工智能，分享实用的 AI 应用。让 AI 变成你触手可及的生产力。