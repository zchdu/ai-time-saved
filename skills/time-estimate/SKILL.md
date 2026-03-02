---
name: time-estimate
description: After completing a coding task (new feature, bug fix, refactor, configuration change), estimate how long it would take a junior engineer, a senior engineer, and how long AI actually took. Trigger when code changes are done and being summarized to the user.
user-invocable: true
---

# Time Estimate: Human vs AI

After completing the current coding task, provide a casual time comparison between human engineers and AI.

## Step 1: Analyze what was done

Look at the completed work in this session:
- What type of task was it? (new feature / bug fix / refactor / config change / docs)
- How many files were modified or created?
- Roughly how many lines of code were changed?
- What was the complexity? (simple change / multi-file coordination / architectural / algorithmic)
- Did it require understanding existing codebase architecture?
- Did it involve external APIs, databases, or infrastructure?

## Step 2: Estimate human time

Use these rough baselines and adjust for actual complexity:

| Task type | Junior (0-2yr) | Senior (5+yr) |
|-----------|---------------|---------------|
| Config / text tweak | 15-30 min | 5-15 min |
| Single-file bug fix | 1-3 hr | 20-60 min |
| New endpoint / function | 2-5 hr | 30-90 min |
| Multi-file feature (frontend + backend + config) | 4-12 hr | 1.5-4 hr |
| Complex refactor (many files, architecture) | 1-3 days | 4-8 hr |
| New system / component from scratch | 2-5 days | 1-2 days |

Adjustment factors:
- Unfamiliar codebase: junior +100%, senior +30%
- Complex business logic: +30-50%
- External API integration: +20-40%
- Well-documented codebase with clear patterns: -20%

**Junior time** should include: reading and understanding existing code, looking up docs, trial-and-error debugging, asking for help.

**Senior time** should include: quick code review, confident implementation, minimal debugging.

## Step 3: Summarize AI work

Note the files changed and approximate lines of code. Don't guess the wall-clock time — just describe what was done.

## Step 4: Output

Use this format (adapt language to match the user's language):

```
---

刚完成: {一句话描述任务}

🧑‍💻 初级工程师大概要 {X-Y} 小时
   — {关键耗时原因}
🧑‍💼 高级工程师大概 {X} 小时
   — {为什么更快}
🤖 AI 改了 {N} 个文件，约 {M} 行代码
   — {一句话描述做了什么}

---
```

## Rules

- Keep it casual and fun, not formal
- Be honest — don't inflate human time or deflate AI effort
- If the task was trivially simple (< 5 min for anyone), say so instead of making up differences
- Adjust estimates to the ACTUAL codebase complexity observed during the task
- For English-speaking users, output in English with the same casual tone
