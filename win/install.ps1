<#
.SYNOPSIS
    Typora LaTeX Theme & Fonts 一键安装脚本 (Windows PowerShell)
.DESCRIPTION
    自动将主题 CSS 复制到 Typora 主题目录，并将配套字体安装到当前用户字体库。
#>

$ErrorActionPreference = "Stop"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Typora LaTeX Theme 一键安装程序 (Windows)" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$TyporaThemeDir = Join-Path $env:APPDATA "Typora\themes"
$UserFontDir = Join-Path $env:LOCALAPPDATA "Microsoft\Windows\Fonts"
$RegistryFontKey = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"

# 1. 安装主题文件
Write-Host "[1/2] 正在安装主题文件至 Typora..." -ForegroundColor Yellow
if (-not (Test-Path $TyporaThemeDir)) {
    New-Item -ItemType Directory -Path $TyporaThemeDir -Force | Out-Null
}

$Themes = Get-ChildItem -Path (Join-Path $ScriptDir "themes") -Filter "*.css"
foreach ($theme in $Themes) {
    Copy-Item -Path $theme.FullName -Destination $TyporaThemeDir -Force
}
Write-Host "  ✓ 主题文件安装成功！(已安装: latex, latex-dark, latex-custom, latex-custom-dark)" -ForegroundColor Green

# 2. 安装配套字体至用户字体库 (免管理员权限)
Write-Host "[2/2] 正在安装配套字体至系统 (当前用户)..." -ForegroundColor Yellow
if (-not (Test-Path $UserFontDir)) {
    New-Item -ItemType Directory -Path $UserFontDir -Force | Out-Null
}

$FontFiles = Get-ChildItem -Path (Join-Path $ScriptDir "fonts") -Include "*.ttf", "*.otf", "*.TTF", "*.OTF" -Recurse
foreach ($font in $FontFiles) {
    $targetPath = Join-Path $UserFontDir $font.Name
    Copy-Item -Path $font.FullName -Destination $targetPath -Force
    
    # 注册字体表项以便系统即时识别
    $fontValueName = $font.Name + " (TrueType)"
    New-ItemProperty -Path $RegistryFontKey -Name $fontValueName -Value $targetPath -PropertyType String -Force | Out-Null
}
Write-Host "  ✓ 配套字体安装及注册完成！" -ForegroundColor Green

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  安装完成！请完全重启 Typora 后在【主题】菜单中选择：" -ForegroundColor Cyan
Write-Host "   - Latex" -ForegroundColor White
Write-Host "   - Latex Dark" -ForegroundColor White
Write-Host "   - Latex Custom (12pt · 手动编号)" -ForegroundColor White
Write-Host "   - Latex Custom Dark (12pt · 手动编号)" -ForegroundColor White
Write-Host "==========================================" -ForegroundColor Cyan
