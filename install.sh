#!/bin/bash

set -e

echo "🚀 正在安装 Flutter Skills for Claude Code..."

# 设置颜色输出
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查 Claude 技能目录
SKILLS_DIR="$HOME/.claude/skills"
if [ ! -d "$SKILLS_DIR" ]; then
    echo -e "${YELLOW}创建 Claude 技能目录: $SKILLS_DIR${NC}"
    mkdir -p "$SKILLS_DIR"
fi

# 临时目录
TEMP_DIR="/tmp/flutter-skills-$$"

# 清理函数
cleanup() {
    if [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

# 设置退出时清理
trap cleanup EXIT

# 克隆仓库
echo "📦 正在下载技能..."
git clone --depth 1 https://github.com/wuppaxue-collab/skills.git "$TEMP_DIR"

# 安装技能
echo "📂 正在安装技能到 $SKILLS_DIR..."

if [ -d "$SKILLS_DIR/flutter-mobile-debugging" ]; then
    echo -e "${YELLOW}覆盖现有的 flutter-mobile-debugging 技能${NC}"
    rm -rf "$SKILLS_DIR/flutter-mobile-debugging"
fi
cp -r "$TEMP_DIR/flutter-mobile-debugging" "$SKILLS_DIR/"

if [ -d "$SKILLS_DIR/flutter-mobile-testing" ]; then
    echo -e "${YELLOW}覆盖现有的 flutter-mobile-testing 技能${NC}"
    rm -rf "$SKILLS_DIR/flutter-mobile-testing"
fi
cp -r "$TEMP_DIR/flutter-mobile-testing" "$SKILLS_DIR/"

echo -e "${GREEN}✅ 安装完成！${NC}"
echo ""
echo "已安装的技能："
echo "  • flutter-mobile-debugging - Flutter 应用调试"
echo "  • flutter-mobile-testing - Flutter UI 测试"
echo ""
echo "请重启 Claude Code 以使技能生效。"
echo "使用 '/skills list' 命令验证安装。"
