# Typora LaTeX Theme (macOS & Windows 双平台优化版)

本项目基于 [Keldos-Li/typora-latex-theme](https://github.com/Keldos-Li/typora-latex-theme) 及其[配套字体库](https://github.com/Keldos-Li/typora-latex-theme-fonts)进行二次整理与定制，旨在将 Typora 伪装成精美的 LaTeX 中文排版风格，非常适合用于学术课程论文、实验报告、读书笔记的高效撰写。

---

## 🌟 本版本特性

1. **分平台独立适配 (`mac/` 与 `win/`)**：
   - **macOS**：绑定 `PingFang SC` 界面字体，正文使用 `Family Song`，标题采用方正公文系列与真粗体（有效避免 macOS 版 Typora 导出 PDF 时的伪粗体发虚、重影问题）。
   - **Windows**：绑定 `阿里巴巴普惠体 2.0` 作为界面字体，适配 Windows 原生中文字体族（`家族宋`、`华文黑体` 等）。
2. **每个平台均内置 4 款主题**：
   - **`Latex`**：官方明亮原版（9.5pt 基准字号，带自动递增标题编号 `1`、`1.1` 等）。
   - **`Latex Dark`**：官方深色原版（9.5pt 基准字号，带自动递增标题编号）。
   - **`Latex Custom`**：**自定义明亮版（基准字号调大至 12pt，并彻底取消所有标题及目录的自动编号，适合习惯手动输入章节号的写作者）**。
   - **`Latex Custom Dark`**：**自定义深色版（基准字号调大至 12pt，彻底取消所有自动标题编号）**。
3. **全套配套字体开箱即用**：
   - 内置 `Family Song`（全套粗斜宋体）、`Latin Modern`（LaTeX 官方西文）、`SF Mono`（代码等宽）以及平台专属字体。
4. **一键自动安装**：
   - 随附 `install.sh` (Mac) 与 `install.ps1` (Win)，一键完成主题部署与全套字体安装。

---

## 📁 目录结构

```text
typora-latex-theme/
├── mac/
│   ├── themes/                   # macOS 版 4 套主题 CSS
│   │   ├── latex.css
│   │   ├── latex-dark.css
│   │   ├── latex-custom.css      # 12pt · 手动编号版
│   │   └── latex-custom-dark.css # 12pt · 手动编号版
│   ├── fonts/                    # macOS 完整配套字体库
│   └── install.sh                # macOS 一键安装脚本
├── win/
│   ├── themes/                   # Windows 版 4 套主题 CSS
│   │   ├── latex.css
│   │   ├── latex-dark.css
│   │   ├── latex-custom.css      # 12pt · 手动编号版
│   │   └── latex-custom-dark.css # 12pt · 手动编号版
│   ├── fonts/                    # Windows 完整配套字体库
│   └── install.ps1               # Windows PowerShell 一键安装脚本
└── README.md
```

---

## 🚀 安装步骤

### macOS 用户

1. 克隆或下载本仓库：
   ```bash
   git clone https://github.com/gavincrossv1/typora-latex-theme.git
   cd typora-latex-theme/mac
   ```
2. 运行一键安装脚本：
   ```bash
   chmod +x install.sh
   ./install.sh
   ```
3. **完全退出并重启 Typora**，在顶部菜单栏【主题】下拉菜单中选择任意款 `Latex` 即可。

---

### Windows 用户

1. 克隆或下载本仓库：
   ```powershell
   git clone https://github.com/gavincrossv1/typora-latex-theme.git
   cd typora-latex-theme\win
   ```
2. 右键点击 `install.ps1` 选择 **使用 PowerShell 运行**（或在 PowerShell 终端执行 `./install.ps1`）。
   - 若系统提示执行策略受限，可先运行：`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`。
3. **完全退出并重启 Typora**，在顶部菜单栏【主题】下拉菜单中选择即可。

---

## 📜 鸣谢与版权声明

- 本项目主题样式源自 [Keldos-Li/typora-latex-theme](https://github.com/Keldos-Li/typora-latex-theme)，遵循 GPL-3.0 协议。
- 字体文件收集自开源及各厂商免费分发字体包，详见原作者字体仓库说明。字体版权归各字库公司或原作者所有，仅供个人本地试用与学习交流。
