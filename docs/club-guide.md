# 给俱乐部小伙伴的快速使用说明

## 你需要先准备

1. 安装 Codex 或 Claude Code
2. 安装 `ffmpeg`、`yt-dlp`、`playwright` 和 Chromium
3. 准备火山方舟 API Key
4. 开通模型：`Doubao-Seed-2.0-pro`

## 最快开始

```bash
# Codex 一键安装
bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
open -e ~/.codex/skills/video-transcript/.env
```

Claude Code 用户可以运行：

```bash
TARGET_APP=claude-code bash <(curl -fsSL https://raw.githubusercontent.com/vivianxiao11xl-star/video-transcript-skill/main/bootstrap.sh)
open -e ~/.claude/skills/video-transcript/.env
```

把 `.env` 里的 `DOUBAO_API_KEY` 改成你自己的 Key。

然后：

```bash
python3 ~/.codex/skills/video-transcript/scripts/transcript.py --doctor
```

看到 `✅ 全部就绪` 后，就可以在 Codex 里用：

```text
/video-transcript 视频链接
```

## 示例

```text
/video-transcript http://xhslink.com/o/xxxxxx
```

输出会是一个 Markdown 逐字稿，带段落标题和时间戳。

## 注意

- 不要把 API Key 发给别人
- 不要把 `.env` 上传 GitHub
- 长视频会花时间，也会产生 API 费用
- 小红书/抖音/B站偶尔会因为平台改版抓取失败
