# 快速安装指南

## 在新设备上安装 Flutter Skills

### 步骤 1：添加市场源

编辑配置文件：

```bash
nano ~/.claude/plugins/known_marketplaces.json
```

在 JSON 文件中添加以下内容（注意保持 JSON 格式，如果已有其他市场源，需要用逗号分隔）：

```json
{
  "flutter-skills": {
    "source": {
      "source": "github",
      "repo": "wuppaxue-collab/skills"
    },
    "installLocation": "/Users/你的用户名/.claude/plugins/marketplaces/flutter-skills",
    "autoUpdate": true
  }
}
```

**重要：** 将 `/Users/你的用户名/` 替换为你实际的用户目录路径。

### 步骤 2：重启 Claude Code

保存文件后，完全退出并重启 Claude Code。

### 步骤 3：安装插件

在 Claude Code 中执行：

```
/plugin add wuppaxue-collab/skills
```

或者打开插件管理界面：

```
/plugin
```

然后在 Marketplaces 标签中找到 flutter-skills，按 Enter 安装。

### 步骤 4：验证安装

```
/skills list
```

应该能看到：
- flutter-mobile-debugging
- flutter-mobile-testing

## 完整配置示例

如果你的 `~/.claude/plugins/known_marketplaces.json` 是空的或者新建的，完整内容应该是：

```json
{
  "flutter-skills": {
    "source": {
      "source": "github",
      "repo": "wuppaxue-collab/skills"
    },
    "installLocation": "/Users/你的用户名/.claude/plugins/marketplaces/flutter-skills",
    "autoUpdate": true
  }
}
```

如果已有其他市场源（如 superpowers-marketplace），格式应该是：

```json
{
  "superpowers-marketplace": {
    "source": {
      "source": "github",
      "repo": "obra/superpowers-marketplace"
    },
    "installLocation": "/Users/你的用户名/.claude/plugins/marketplaces/superpowers-marketplace",
    "lastUpdated": "2026-02-05T02:25:30.890Z",
    "autoUpdate": true
  },
  "flutter-skills": {
    "source": {
      "source": "github",
      "repo": "wuppaxue-collab/skills"
    },
    "installLocation": "/Users/你的用户名/.claude/plugins/marketplaces/flutter-skills",
    "autoUpdate": true
  }
}
```

## 使用技能

安装完成后，技能会在对应场景下自动使用：

- **flutter-mobile-debugging**: 调试 Flutter 应用崩溃、性能问题等
  - 示例："帮我看看 Flutter 应用的日志"

- **flutter-mobile-testing**: 验证 Flutter UI 变更
  - 示例："验证一下登录按钮是否显示正确"

## 故障排除

### 市场源未显示

1. 检查 JSON 格式是否正确（使用 `cat ~/.claude/plugins/known_marketplaces.json` 查看）
2. 确认路径中的用户名是否正确
3. 完全退出 Claude Code 后重启（不是只关闭窗口）

### 插件未安装成功

1. 检查网络连接（需要访问 GitHub）
2. 在终端执行 `git clone https://github.com/wuppaxue-collab/skills.git /tmp/test` 测试 GitHub 连接
3. 查看 Claude Code 日志是否有错误信息

### 技能不可用

1. 运行 `/skills list` 确认技能已加载
2. 检查 `~/.claude/plugins/marketplaces/flutter-skills/` 目录是否存在
3. 重新安装插件：在 `/plugin` 界面中移除后重新安装

## 卸载

如果需要移除插件：

1. 打开 `/plugin` 界面
2. 在 Installed 标签中找到 flutter-mobile-skills
3. 按空格键禁用或移除

如果需要移除市场源：

1. 编辑 `~/.claude/plugins/known_marketplaces.json`
2. 删除 flutter-skills 相关配置
3. 重启 Claude Code
