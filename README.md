# ai-time-saved

A [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skill that shows you how long a task would take a human engineer vs how long AI took.

After completing a coding task, Claude automatically outputs something like:

```
刚完成: 监控页面新增工作时间统计

🧑‍💻 初级工程师大概要 4-6 小时
   — 光理解插件架构就得 1-2 小时
🧑‍💼 高级工程师大概 1.5 小时
   — 知道套路，直接写
🤖 AI 改了 4 个文件，约 120 行代码
   — 新增采样脚本 + 检查逻辑 + HTMX 模板 + 页面布局
```

It's a toy — the estimates are rough (LLM vibes, not stopwatch precision), but it's fun to see after every task.

## Install

```bash
git clone https://github.com/zchdu/ai-time-saved.git
cd ai-time-saved
bash install.sh
```

This copies the skill to `~/.claude/skills/time-estimate/`.

## How it works

- **Auto-trigger**: Claude detects when a coding task is done and shows the estimate automatically
- **Manual trigger**: Type `/time-estimate` anytime to invoke it
- **No extra tools needed**: Pure prompt-based skill, no hooks or scripts

The estimation uses rough baselines:

| Task type | Junior (0-2yr) | Senior (5+yr) |
|-----------|---------------|---------------|
| Config / text tweak | 15-30 min | 5-15 min |
| Single-file bug fix | 1-3 hr | 20-60 min |
| New endpoint / function | 2-5 hr | 30-90 min |
| Multi-file feature | 4-12 hr | 1.5-4 hr |
| Complex refactor | 1-3 days | 4-8 hr |
| New system from scratch | 2-5 days | 1-2 days |

Adjusted for codebase familiarity, business logic complexity, and external integrations.

## Token cost

~1-2k extra tokens per invocation. Negligible.

## Uninstall

```bash
bash uninstall.sh
```

## License

MIT
