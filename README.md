# video-transcript Skill：视频自动转逐字稿

> B 站 / 抖音 / 小红书 / YouTube / 本地视频 → 自动生成带时间戳的 Markdown 逐字稿。

这是基于黄叔开源仓库 [`Backtthefuture/huangshu`](https://github.com/Backtthefuture/huangshu/tree/main/skills/video-transcript) 的 `video-transcript` Skill 做的俱乐部分享版，适配 Codex / Claude Code，并推荐把输出保存到 Obsidian。

## 能做什么

- 把视频课、直播回放、访谈转成可搜索文字稿
- 把小红书 / 抖音 / B 站 / YouTube 视频沉淀到 Obsidian
- 后续基于逐字稿继续做总结、拆条、公众号文章、小红书选题等

## 支持平台

| 平台 | 链接格式 | 备注 |
|---|---|---|
| B 站 | `bilibili.com/video/BV...`、`b23.tv/...` | 自动抓视频/音频并合并 |
| 抖音 | `douyin.com/video/...`、`v.douyin.com/...` | 只支持视频，不支持图文 note |
| 小红书 | `xiaohongshu.com/explore/...`、`xhslink.com/...` | 只支持视频笔记，不支持图文笔记 |
| YouTube | `youtube.com/watch?v=...`、`youtu.be/...` | 依赖 `yt-dlp` |
| 本地文件 | `/path/to/video.mp4` | 支持本地 mp4 等视频 |

## 重要提醒：API Key 安全

**不要把你的 `.env`、API Key、带 Key 的截图上传到 GitHub 或发给别人。**

如果 Key 泄露：请立刻到火山方舟后台禁用/删除旧 Key，并新建一个。

## 依赖

macOS 推荐：

```bash
brew install ffmpeg
python3 -m pip install --user --upgrade yt-dlp playwright
python3 -m playwright install chromium
```

然后需要准备火山方舟 API Key：

1. 打开 API Key 页面：<https://console.volcengine.com/ark/region:ark+cn-beijing/apiKey>
2. 创建 API Key，复制 `ark-...` 开头的字符串
3. 到「模型广场」开通：`Doubao-Seed-2.0-pro`
4. 模型 ID 确认为：`doubao-seed-2-0-pro-260215`

## 安装到 Codex

一键安装：

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
```

或手动安装：

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/vivianxiao11xl-star/video-transcript-skill.git ~/.codex/skills/video-transcript
cd ~/.codex/skills/video-transcript
cp .env.example .env
open -e .env
```

在 `.env` 里填写：

```bash
DOUBAO_API_KEY=ark-你的真实APIKey
DOUBAO_MODEL=doubao-seed-2-0-pro-260215
VIDEO_TRANSCRIPT_OUTPUT_DIR=Clippings/video-transcripts
```

自检：

```bash
python3 ~/.codex/skills/video-transcript/scripts/transcript.py --doctor
```

看到 `✅ 全部就绪` 就可以使用。

## 安装到 Claude Code

一键安装：

```bash
TARGET_APP=claude-code bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
```

或手动安装：

```bash
mkdir -p ~/.claude/skills
git clone https://github.com/vivianxiao11xl-star/video-transcript-skill.git ~/.claude/skills/video-transcript
cd ~/.claude/skills/video-transcript
cp .env.example .env
open -e .env
```

填写 `.env` 后自检：

```bash
python3 ~/.claude/skills/video-transcript/scripts/transcript.py --doctor
```

> 如果你同时使用 Codex 和 Claude Code，可以让两边共享同一份 `.env`，避免重复填写 Key。

## 使用方法

在 Codex / Claude Code 里：

```text
/video-transcript 视频链接
```

例如：

```text
/video-transcript https://www.bilibili.com/video/BVxxxx
/video-transcript http://xhslink.com/o/xxxxxx
```

也可以直接在终端运行：

```bash
python3 ~/.codex/skills/video-transcript/scripts/transcript.py "视频链接" --output-dir "Clippings/video-transcripts"
```

## 输出格式

输出是 Markdown：

```markdown
# 视频标题

> 时长 54:17 | 来源: https://...

## 1. 开场 [00:00 - 01:21]
这里是视频里的原话……

## 2. 主题展开 [01:22 - 05:14]
这里是视频里的原话……
```

默认会同时：

1. 在终端 / Agent 对话里输出完整逐字稿
2. 保存 `.md` 文件到输出目录，例如 `Clippings/video-transcripts/`

## 推荐工作流

1. 运行 `/video-transcript 视频链接`
2. 等它完成转录
3. 打开生成的 Markdown 文件
4. 继续让 AI 做：
   - 总结核心观点
   - 提取金句
   - 改写公众号文章
   - 拆成小红书选题
   - 做成课程笔记

## 常见问题

### 提示 `没配 DOUBAO_API_KEY`

检查 `.env`：

```bash
open -e ~/.codex/skills/video-transcript/.env
```

确保有：

```bash
DOUBAO_API_KEY=ark-你的真实APIKey
```

并且前面没有 `#`。

### 提示 `ModelNotOpen`

说明 API Key 有效，但模型没开通。去火山方舟「模型广场」开通：

```text
Doubao-Seed-2.0-pro
```

### 小红书 / 抖音抓不到

平台前端经常变化，可能临时失效。可以：

- 换短链接试试
- 先把视频下载到本地，再转录本地文件
- 查看 `FALLBACK.md`

### 逐字稿不是 100% 逐字

这个工具使用豆包视频理解模型，不是传统 ASR。Prompt 会要求严格逐字，但模型仍可能漏字、改写或误识别。

## 费用

调用火山方舟 API 会产生费用。建议先用短视频测试，再处理长视频。

## 致谢

基于黄叔开源 Skill 集合中的 `video-transcript` 改造：

- https://github.com/Backtthefuture/huangshu/tree/main/skills/video-transcript

