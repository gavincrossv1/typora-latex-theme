#!/usr/bin/env bash
# Typora LaTeX Theme & Fonts 一键安装脚本 (macOS)
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_DIR="$HOME/Library/Application Support/abnerworks.Typora/themes"
FONT_DIR="$HOME/Library/Fonts"

echo "=========================================="
echo "  Typora LaTeX Theme 一键安装程序 (macOS)"
echo "=========================================="

# 1. 检查并安装主题文件
echo "[1/2] 正在安装主题文件至 Typora..."
mkdir -p "$THEME_DIR"
cp -f "$SCRIPT_DIR/themes/"*.css "$THEME_DIR/"
echo "  ✓ 主题文件安装成功！(已安装: latex, latex-dark, latex-custom, latex-custom-dark)"

# 2. 检查并安装字体
echo "[2/2] 正在安装配套字体至系统..."
mkdir -p "$FONT_DIR"
find "$SCRIPT_DIR/fonts" -type f \( -name "*.ttf" -o -name "*.otf" -o -name "*.TTF" -o -name "*.OTF" \) -exec cp -f {} "$FONT_DIR/" \;
echo "  ✓ 配套字体安装成功！(包括 Family Song, Latin Modern, SF Mono, 方正公文及粗体)"

echo "=========================================="
echo "  安装完成！请完全重启 Typora 后在【主题】菜单中选择："
echo "   - Latex"
echo "   - Latex Dark"
echo "   - Latex Custom (12pt · 手动编号)"
echo "   - Latex Custom Dark (12pt · 手动编号)"
echo "=========================================="
