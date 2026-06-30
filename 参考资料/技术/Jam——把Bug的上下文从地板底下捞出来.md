# 解决了无数程序员最头疼的问题！

原创 liuxin liuxin 码农翻身

_2026年6月26日 08:55_ _河南_ 39人

在小说阅读器读本章

去阅读

在小说阅读器中沉浸阅读

每个程序员都遇到过这种情况：

  

你正沉浸式写代码，突然测试小张发来一串消息：“登录挂了”，“点按钮没反应”，附带几张灵魂截图。

  

被打断的你强忍怒火：“什么浏览器？” “清理下缓存！”

  

小张折腾了半天：“还是不行啊！”

  

......

  

来来回回，断断续续的聊天让你不胜其烦。

  

一小时后，你放弃了，直接冲到小张工位，熟练地按下F12，打开开发者工具……

  

终于，你发现网络请求返回了个401 错误，但前端代码竟然没把这个错误弹出来。

  

就这么个破事儿，5分钟能搞定，硬生生耗掉了一个下午。

  

很多时候，程序员已经把能试的都试了一遍，还是复现不出问题，只能在 Bug 系统里留下一句：“无法复现。”

  

而另一边，测试同样很无奈：“我这边明明每一步都有截图，操作路径也写得很清楚，你是故意的吧！”

  

其实谁也怪不得谁，测试执行完那一刻，所有“上下文”就灰飞烟灭了：数据库状态、缓存、网络波动、第三方接口抽风……这些东西不会出现在任何一张截图上。

  

没有上下文，程序员在Debug的时候就是瞎子摸象。

  

怎么办呢？

  

  

**0****1**

**灵机一动**

  

  

时间回到2020年，一位叫Dani Grant（丹尼·格兰特）的妹子和她的好朋友Irtefa准备创业。

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIExaCG54xXx8tr3SYEk8OJn9zGzaHVVOREmvSHshgzfgTVgSNicq2W0Q/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=1)

  

两人头脑风暴，在Notion上激情澎湃地列出了140个“绝妙”点子，觉得自己马上就要成为下一个独角兽。

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIpR7ZWQ2pfx5uH0CNbg16AYR2XsRLD066dxlr14ic7Yib4ct0bGHrFOGQ/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=2)

  

但是他们并没有意识到，这些看起来很酷的点子并没有解决真正实际的痛点问题。

  

直到有一天，Irtefa吐槽了一句他在Cloudflare的工作日常：

  

“我们产品提Bug，开发死活复现不了，两边来回扯皮，都快打起来了。”

  

丹尼灵机一动：“这才是真需求啊！”

  

他们决定做一个浏览器扩展，让任何人都能一键生成程序员看了想流泪的Bug报告。

  

这个Bug报告有多“感人”呢？

  

它记录下了所有的操作步骤：

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIcDeTvAPoHhrOtxtgRhU5Peg8qpgvcAxeJcFLicnO4ghWCajoKqyaYrw/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=3)

  

对操作过程进行了录像：

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIrJUVKIvyhDnlHLd3Rh7micJuEX5tNBQx3gibm610vvaV8OMoGXngNGnw/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=4)

  

记录下了所有的HTTP请求和响应的数据：

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIjL29VSPnTOd91C9pT9Rk8RaCZicibANla6lAic9gSffWBXXwPmZaVAibjg/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=5)

  

当然也支持各种简单的涂鸦标记：

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIUHj3viaqfLODWibojH3nnIwtjJjXiauMyojY0NziclPoGx2dRx250J3gWA/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=6)

  

他们把这个产品叫做Jam。

  

说起来容易，做起来很难，让用户接受一个新产品是非常困难的。

  

Jam早期用户少得可怜，前前后后发布了7个版本，全扑街了。

  

 丹尼在早期博客里记录了自己一路的挣扎，那叫一个辛酸。

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIO6Mt4cchSHLmNb9Kc8h8Cdmsv1wWGHmf6on3X2flHoKxxUu8tlO99A/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=7)

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpITqjibiaFS2MMwqzegXN7CrZx2k3QibGsVpdVMc6TroAgJUGPctP7Xicu8A/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=8)

  

  

**0****2**

**苦尽甘来**

  

  

  

但熬过去之后，2023年Jam彻底爆发了：用户数增长10倍，达到了75000的里程碑。

  

  

![图片](https://mmbiz.qpic.cn/mmbiz_png/KyXfCrME6UL8V0qTd1ibLuSicgINaMsxpIq2b4SOzkZl8MQvQ3ckL0B0F8xjNuynO9pVyv0jS1owRB7Ro2LUwn1Q/640?wx_fmt=png&from=appmsg&wxfrom=5&wx_lazy=1&tp=wxpic#imgIndex=9)

  

HP、戴尔、Salesforce、联合利华、Autodesk、迪士尼这些巨头纷纷“上车”，用户覆盖了150多个国家。

  

2024年2月，Jam拿到了GGV Capital领投的890万美元A轮融资，从此如虎添翼，各种新功能层出不穷：

  

1.完善和GitLab、Notion、LogRocket 、Azure DevOps等工具的集成。

  

2.增加对客服的支持

  

用户遇到问题，和客服交谈时，客服可以发起一个录屏请求，客户同意后，就能把客户的控制台日志、网络请求、重现步骤、会话详情发给客服（然后转给开发），无需来回沟通。

  

3.进入移动领域

  

录制手机屏幕，Jam 会自动抓取所有技术细节（操作系统、电池电量等）。然后直接分享到你的缺陷跟踪工具

  

4.AI 生成Bug 报告

  

5.支持Claude、Cursor、Codex 可直接读取 Jam 数据，快速修复Bug

  

到2026年，Jam的用户数超过20万，累计处理了1700多万个Bug记录。

  

而Jam团队只有20来个人，丹尼的哲学是：“当事情很重要时，要安排更少的人，而不是更多。”

  

丹妮希望将来Jam能像Instagram那样，20个人支持100万用户。

  

  

  

**0****3**

**这个想法很简单啊!**

  

  

你可能会觉得：这个想法很简单啊，一个Chrome插件，我也能做！

  

我第一次看到Jam这个工具，是非常感慨的，因为我在多年的Web应用开发中，不止一次遇到这样的问题。

  

我也想过很多解决方法，例如：遇到Bug截屏时，可以把上下文也“截下来”，形成一个快照，发给程序员去调试。

  

但具体怎么做呢？ Web应用有服务器端，那里的内存情况，JVM状态，Redis，ES，Database这些上下文根本就拿不到啊！

  

于是就一次次地把这个想法给搁置了。

  

而Jam的聪明之处就在于，服务器的上下文拿不到，但是浏览器端的上下文完全可以拿到啊！

  

从这个足够小、足够具体、足够痛的痛点切进去，先解决浏览器端能解决的问题，就拯救了程序员80%的高血压了，剩下的慢慢来。

  

先做减法，再做加法。