# video-transcript Skill

把 **B站 / 抖音 / 小红书 / YouTube / 本地视频** 自动转成带时间戳的 Markdown 逐字稿。

基于黄叔开源项目 [`Backtthefuture/huangshu`](https://github.com/Backtthefuture/huangshu/tree/main/skills/video-transcript) 的 `video-transcript` Skill 做了 Codex / Claude Code 适配。

## 一句话安装

### Codex

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
```

### Claude Code

```bash
TARGET_APP=claude-code bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
```

## 配置

安装后打开 `.env`，填自己的火山方舟 API Key：

```bash
# Codex
open -e ~/.codex/skills/video-transcript/.env

# Claude Code
open -e ~/.claude/skills/video-transcript/.env
```

填写格式：

```bash
DOUBAO_API_KEY=ark-你的真实APIKey
DOUBAO_MODEL=doubao-seed-2-0-pro-260215
VIDEO_TRANSCRIPT_OUTPUT_DIR=Clippings/video-transcripts
```

还需要在火山方舟开通模型：

```text
Doubao-Seed-2.0-pro
```

## 自检

```bash
python3 ~/.codex/skills/video-transcript/scripts/transcript.py --doctor
```

看到 `✅ 全部就绪` 就可以用了。

## 使用

在 Codex / Claude Code 里输入：

```text
/video-transcript 视频链接
```

例如：

```text
/video-transcript http://xhslink.com/o/xxxxxx
```

## 注意

- 不要上传 `.env`
- 不要把 API Key 发给别人
- 长视频会花时间，也会产生火山方舟 API 费用
- 小红书 / 抖音 / B站 偶尔可能因平台改版抓取失败

更多说明见：[`docs/club-guide.md`](docs/club-guide.md)
