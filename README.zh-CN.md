<p align="center">
  <img src="assets/logo.svg" width="120" alt="ai-time-saved">
  <h1 align="center">ai-time-saved</h1>
  <p align="center">
    <strong>AI 刚帮你做完，看看人类要多久。</strong>
  </p>
  <p align="center">
    <a href="README.md">English</a> &bull; <a href="#安装">安装</a> &bull; <a href="#常见问题">常见问题</a>
  </p>
  <p align="center">
    <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="License: MIT"></a>
    <a href="https://docs.anthropic.com/en/docs/claude-code"><img src="https://img.shields.io/badge/Claude%20Code-skill-blueviolet.svg" alt="Claude Code"></a>
  </p>
</p>

---

用 Claude Code 3 分钟搞定一个功能，但人来做要多久？**ai-time-saved** 在每次完成任务后自动告诉你。

```
刚完成: 监控页面新增工作时间统计

🧑‍💻 初级工程师大概要 4-6 小时
   — 光理解插件架构就得 1-2 小时
🧑‍💼 高级工程师大概 1.5 小时
   — 知道套路，直接写
🤖 AI 改了 4 个文件，约 120 行代码
   — 新增采样脚本 + 检查逻辑 + HTMX 模板 + 页面布局
```

> **温馨提示：** 估算靠的是 LLM 的"手感"，不是精确计时。当个好玩的速度计看就行，别拿去算工资。

## 工作原理

```
 用 Claude Code 完成一个编码任务
          │
          ▼
 Claude 检测到任务完成（commit、总结等）
          │
          ▼
 Skill 自动触发，回顾刚才改了什么
          │
          ▼
 输出 初级工程师 / 高级工程师 / AI 耗时对比
```

**一个文件，零依赖：**

| 组件 | 功能 |
|------|------|
| `SKILL.md` | 基于 prompt 的 [Claude Code Skill](https://code.claude.com/docs/en/skills) — 无 hook、无脚本、无后台进程。Claude 读取指令，按指令输出，完事。 |

## 安装

```bash
git clone https://github.com/zchdu/ai-time-saved.git
cd ai-time-saved
bash install.sh
```

Skill 会被复制到 `~/.claude/skills/time-estimate/`，搞定。

手动安装：

```bash
mkdir -p ~/.claude/skills/time-estimate
cp skills/time-estimate/SKILL.md ~/.claude/skills/time-estimate/
```

## 使用方式

**自动模式**（默认）：完成编码任务后 Claude 自动触发估算 — 新功能、bug 修复、重构、配置变更都会触发。

**手动模式**：随时输入 `/time-estimate` 获取当前任务的耗时估算。

## 估算逻辑

基于粗略基准，根据实际任务复杂度调整：

| 任务类型 | 初级工程师 (0-2年) | 高级工程师 (5+年) |
|---------|-------------------|-------------------|
| 配置 / 文案修改 | 15-30 分钟 | 5-15 分钟 |
| 单文件 bug 修复 | 1-3 小时 | 20-60 分钟 |
| 新接口 / 函数 | 2-5 小时 | 30-90 分钟 |
| 多文件功能（前端 + 后端） | 4-12 小时 | 1.5-4 小时 |
| 复杂重构（多文件） | 1-3 天 | 4-8 小时 |
| 全新系统 / 组件 | 2-5 天 | 1-2 天 |

**调整因素：**
- 不熟悉的代码库 → 初级 +100%，高级 +30%
- 复杂业务逻辑 → +30-50%
- 外部 API 集成 → +20-40%
- 文档完善的代码库 → -20%

## 文件结构

```
~/.claude/
└── skills/
    └── time-estimate/
        └── SKILL.md        # 整个 skill 就这一个文件
```

## 常见问题

<details>
<summary><strong>估算准吗？</strong></summary>

大差不差。预期 2-3 倍误差范围。估 2 小时实际可能 1-4 小时。方向对就行，别较真。
</details>

<details>
<summary><strong>额外消耗多少 token？</strong></summary>

每次约 1-2k token，相比任务本身可以忽略不计。
</details>

<details>
<summary><strong>能关掉自动触发吗？</strong></summary>

在 `SKILL.md` 的 frontmatter 中加上 `disable-model-invocation: true`，之后只有手动输入 `/time-estimate` 才会运行。
</details>

<details>
<summary><strong>支持英文输出吗？</strong></summary>

支持。会自动适配你对话使用的语言。示例显示中文是因为作者说中文。
</details>

<details>
<summary><strong>怎么卸载？</strong></summary>

```bash
bash uninstall.sh
```

或者直接 `rm -rf ~/.claude/skills/time-estimate`。
</details>

## 环境要求

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code)（需支持 skills 功能）

## 参与贡献

欢迎提 Issue 和 PR。保持简单 — 这就是个玩具。

## 许可证

[MIT](LICENSE)
