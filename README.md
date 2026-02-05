# Flutter Mobile Skills for Claude Code

这是两个用于 Claude Code 的自定义技能，专门用于 Flutter 移动应用的调试和测试。

## 技能列表

### 1. flutter-mobile-debugging
用于调试 Flutter 应用在物理设备或模拟器上的问题，包括崩溃、性能问题、视频播放问题，或设备间的行为差异。

**使用场景：**
- 应用崩溃或行为异常
- 用户要求"查看日志"或"看看哪里出错了"
- 调试性能、视频播放或平台特定问题
- 比较模拟器与真机的行为差异

### 2. flutter-mobile-testing
用于在设备上验证 Flutter 应用的 UI 变更，包括截图捕获、前后状态对比、验证按钮显示、测试交互功能。

**使用场景：**
- 修改了 UI 需要验证是否正常工作
- 确认按钮/元素显示是否正确
- 测试交互（点击、滑动）是否产生预期结果
- 验证视觉变更（颜色、布局、文字）

## 安装方法

### 方法一：从 GitHub 克隆（推荐）

直接从 GitHub 仓库安装到全局技能目录：

```bash
# 克隆仓库到临时目录
git clone https://github.com/wuppaxue-collab/skills.git /tmp/flutter-skills

# 复制技能到 Claude Code 全局目录
mkdir -p ~/.claude/skills
cp -r /tmp/flutter-skills/flutter-mobile-debugging ~/.claude/skills/
cp -r /tmp/flutter-skills/flutter-mobile-testing ~/.claude/skills/

# 清理临时文件
rm -rf /tmp/flutter-skills
```

或者一键安装脚本：

```bash
bash <(curl -s https://raw.githubusercontent.com/wuppaxue-collab/skills/main/install.sh)
```

### 方法二：项目级安装

将技能安装到特定项目的 `.claude/skills/` 目录：

```bash
# 在项目根目录执行
git clone https://github.com/wuppaxue-collab/skills.git /tmp/flutter-skills
mkdir -p .claude/skills
cp -r /tmp/flutter-skills/flutter-mobile-debugging .claude/skills/
cp -r /tmp/flutter-skills/flutter-mobile-testing .claude/skills/
rm -rf /tmp/flutter-skills
```

### 方法三：手动安装

如果你已经下载或克隆了仓库，可以手动复制：

```bash
# 复制到全局目录
cp -r flutter-mobile-debugging ~/.claude/skills/
cp -r flutter-mobile-testing ~/.claude/skills/

# 或复制到项目目录
mkdir -p .claude/skills
cp -r flutter-mobile-debugging .claude/skills/
cp -r flutter-mobile-testing .claude/skills/
```

### 验证安装

安装完成后，重启 Claude Code 并运行：

```bash
claude code
# 在对话中输入：
/skills list
```

你应该能看到 `flutter-mobile-debugging` 和 `flutter-mobile-testing` 两个技能。

### 更新技能

如果技能有更新，重新运行安装命令即可覆盖旧版本。

## 使用方法

安装完成后，在与 Claude Code 对话时，这些技能会自动可用。Claude 会在适当的场景下自动使用这些技能。

**示例：**

```
你：应用崩溃了，帮我看看日志
Claude：[自动使用 flutter-mobile-debugging 技能读取设备日志]

你：帮我测试一下登录按钮是否显示正确
Claude：[自动使用 flutter-mobile-testing 技能进行 UI 验证]
```

## 技能文件结构

每个技能目录包含一个 `SKILL.md` 文件：

```
flutter-mobile-debugging/
└── SKILL.md          # 技能定义和使用说明

flutter-mobile-testing/
└── SKILL.md          # 技能定义和使用说明
```

## 前置要求

### Android 开发
- Android SDK Platform Tools（包含 adb 命令）
- 已连接的 Android 设备或运行中的模拟器

### iOS 开发
- macOS 系统
- Xcode Command Line Tools
- 已连接的 iOS 设备或运行中的模拟器

## 技术细节

这些技能利用以下工具进行设备交互：

- **Android**: ADB (Android Debug Bridge)
  - 日志读取：`adb logcat`
  - 截图：`adb exec-out screencap`
  - UI 层级：`adb shell uiautomator dump`
  - 交互模拟：`adb shell input tap/swipe/text`

- **iOS**: Xcode 命令行工具
  - 设备列表：`xcrun xctrace list devices`
  - 日志读取：`xcrun simctl spawn`
  - 截图：`xcrun simctl io booted screenshot`

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这些技能。

## 许可证

MIT License

## 相关链接

- [Claude Code 官方文档](https://claude.ai/code)
- [Flutter 官方文档](https://flutter.dev)
- [Android ADB 文档](https://developer.android.com/tools/adb)
