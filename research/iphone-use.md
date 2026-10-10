# iPhone Use：AI 操作 iPhone 专项研究（第 31 项）

- 官方仓库：https://github.com/leeguooooo/iphone-use
- 研究日期：2026-10-10
- 分类：Computer Use、手机自动化、Agent 工具集成
- 状态：**候选；未安装、未连接真机、未验收**
- 许可证：需在正式测试前检查所选 commit 的 LICENSE、NOTICE 和依赖条款，**本文不作商用许可保证**。

## 核心概念

Computer Use 是模型或 Agent 通过视觉/控制工具完成界面操作的能力；Windows MCP 把 Windows 操作工具以 MCP 暴露。iPhone Use 则聚焦对真实 iPhone 的程序化屏幕和交互操作，可能通过 MCP/HTTP 接给上层 Agent，具体接口以选定版本的 README 为准。

## 适合晨羽的价值

1. 研究将 TokenRouter 作为模型统一入口，外部 Agent 作为决策层，iPhone Use 作为手机执行层的可行性。
2. 用测试 iPhone 自动验证移动端 AI 应用的初次配置、登录、API 接入步骤。
3. 建立 Windows/浏览器/iPhone 三类操作工具的统一测试验收方法；不需要将手机控制功能直接嵌入 TokenRouter。

## 最小 PoC

1. 确认官方兼容的 macOS / Xcode / iOS 版本与 USB/开发者模式要求。
2. 在专用测试 Mac、测试 iPhone 上安装；仅使用测试账号与测试数据。
3. 验证截图 → 点击 → 滑动 → 文本输入 → 界面状态确认的闭环。
4. 如提供 MCP/HTTP 接入，则验证受限 Agent 能调用工具，不接触 Apple ID 凭据和个人相册。
5. 测试异常：断连、权限撤回、锁屏、敏感确认按钮、误触与重复执行。

## 风险

- 控制真机属于高权限操作；禁止对真实个人手机开放任意 Agent 工具。
- 具体可用功能取决于 Apple 平台授权、系统版本和项目维护状态。
- 金融交易、账号密码、隐私数据、安装配置修改需用户显式批准。
- 项目源代码/许可证/第三方依赖按固定 commit 独立审查；不得因为仓库公开就默认可商用或稳定可部署。

**下一步：** 审核 README + LICENSE → 选定 tag/commit → 测试机运行 → 输出兼容报告。