# OpenCode 对话记录——迁入日志

> 原位置：`C:\Users\tuzhenhua\.local\share\opencode\`
> 迁入日期：2026-06-29
> 原因：翻喂膜施工方案第一节衬管——对话记录从 C 盘搬回 vault，确保数据在本地可控范围内。

## 文件清单

| 文件                | 大小     | 说明               |
| :---------------- | :----- | :--------------- |
| `opencode.db`     | 15 MB  | 主数据库——对话记录存储     |
| `opencode.db-shm` | 32 KB  | SQLite 共享内存文件    |
| `opencode.db-wal` | 4.5 MB | 写入前日志——含最近未合并的更改 |

共约 20 MB。最后修改日期：2026-06-26。

## 恢复方法

如需恢复：将这三个文件拷回 `C:\Users\tuzhenhua\.local\share\opencode\`，覆盖原文件即可。

## 相关

- [[实用资料/数据流向地图——翻喂膜施工方案]]
