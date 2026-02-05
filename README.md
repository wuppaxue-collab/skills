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

像安装官方技能一样，将此仓库添加为 Claude Code 的技能市场。

**📖 详细步骤请查看 [INSTALL.md](./INSTALL.md)**

**简要步骤：**

1. 编辑 `~/.claude/plugins/known_marketplaces.json` 添加市场源配置
2. 重启 Claude Code
3. 执行 `/plugin add wuppaxue-collab/skills` 安装
4. 运行 `/skills list` 验证安装

**优势：**
- ✅ 自动更新
- ✅ 像官方技能一样管理
- ✅ 在所有设备上统一安装

## 使用方法

安装完成后，这些技能会在 Claude Code 对话中自动可用。Claude 会在适当的场景下自动使用这些技能。

**示例：**

```
你：应用崩溃了，帮我看看日志
Claude：[自动使用 flutter-mobile-debugging 技能读取设备日志]

你：帮我测试一下登录按钮是否显示正确
Claude：[自动使用 flutter-mobile-testing 技能进行 UI 验证]
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
