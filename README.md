<p align="center">
  <img src="assets/logo.svg" width="120" alt="ai-time-saved">
  <h1 align="center">ai-time-saved</h1>
  <p align="center">
    <strong>See how long your coding task would take a human — after AI just did it.</strong>
  </p>
  <p align="center">
    <a href="README.zh-CN.md">中文文档</a> &bull; <a href="#install">Install</a> &bull; <a href="#faq">FAQ</a>
  </p>
  <p align="center">
    <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT"></a>
    <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/Claude%20Code-skill-blueviolet.svg" alt="Claude Code"></a>
  </p>
</p>

---

You just finished a feature in 3 minutes with Claude Code. But how long would it have taken a human? **ai-time-saved** tells you — automatically, after every task.

```
刚完成: 监控页面新增工作时间统计

🧑‍💻 初级工程师大概要 4-6 小时
   — 光理解插件架构就得 1-2 小时
🧑‍💼 高级工程师大概 1.5 小时
   — 知道套路，直接写
🤖 AI 改了 4 个文件，约 120 行代码
   — 新增采样脚本 + 检查逻辑 + HTMX 模板 + 页面布局
```

> **Fair warning:** The estimates are LLM vibes, not stopwatch science. Think of it as a fun speedometer, not a billing system.

## How It Works

```
 You complete a coding task with Claude Code
          │
          ▼
 Claude detects the task is done (commit, summary, etc.)
          │
          ▼
 The skill auto-triggers and reviews what was changed
          │
          ▼
 Outputs a casual Junior / Senior / AI time comparison
```

**One file, zero dependencies:**

| Component | What it does |
|-----------|-------------|
| `SKILL.md` | A prompt-based [Claude Code skill](https://code.claude.com/docs/en/skills) — no hooks, no scripts, no background processes. Claude reads it, follows the instructions, done. |

## Install

```bash
git clone https://github.com/zchdu/ai-time-saved.git
cd ai-time-saved
bash install.sh
```

This copies the skill to `~/.claude/skills/time-estimate/`. That's it.

Or manually:

```bash
mkdir -p ~/.claude/skills/time-estimate
cp skills/time-estimate/SKILL.md ~/.claude/skills/time-estimate/
```

## Usage

**Auto mode** (default): Claude triggers the estimate automatically after completing a coding task — new features, bug fixes, refactors, config changes.

**Manual mode**: Type `/time-estimate` anytime to get an estimate for the work just done.

## Estimation Logic

The skill uses rough baselines, adjusted for actual task complexity:

| Task type | Junior (0-2yr) | Senior (5+yr) |
|-----------|---------------|---------------|
| Config / text tweak | 15-30 min | 5-15 min |
| Single-file bug fix | 1-3 hr | 20-60 min |
| New endpoint / function | 2-5 hr | 30-90 min |
| Multi-file feature (frontend + backend) | 4-12 hr | 1.5-4 hr |
| Complex refactor (many files) | 1-3 days | 4-8 hr |
| New system from scratch | 2-5 days | 1-2 days |

**Adjustment factors:**
- Unfamiliar codebase → junior +100%, senior +30%
- Complex business logic → +30-50%
- External API integration → +20-40%
- Well-documented codebase → -20%

## File Structure

```
~/.claude/
└── skills/
    └── time-estimate/
        └── SKILL.md        # The entire skill — one file
```

## FAQ

<details>
<summary><strong>How accurate are the estimates?</strong></summary>

Ballpark. Expect 2-3x variance. A "2 hour" estimate might mean 1-4 hours in reality. It's directionally useful, not precise.
</details>

<details>
<summary><strong>Does it cost extra tokens?</strong></summary>

~1-2k tokens per invocation. Negligible compared to the task itself.
</details>

<details>
<summary><strong>Can I stop it from auto-triggering?</strong></summary>

Add `disable-model-invocation: true` to the frontmatter in `SKILL.md`. Then it only runs when you type `/time-estimate`.
</details>

<details>
<summary><strong>Does it work in languages other than English?</strong></summary>

Yes. It adapts to the language you're using in the conversation. The examples show Chinese output because the author speaks Chinese.
</details>

<details>
<summary><strong>How do I uninstall?</strong></summary>

```bash
bash uninstall.sh
```

Or just `rm -rf ~/.claude/skills/time-estimate`.
</details>

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) with skills support

## Contributing

Issues and PRs welcome. Keep it simple — it's a toy.

## License

[MIT](LICENSE)
