# 新增 20 个开源项目：Computer Use / Windows MCP / Agent / RAG / 私有化

更新日期：2026-10-10。**为研发研究优先级，不是完整兼容性、许可证或安全审计。** 以下与第一批十个项目不重复。源码引用是官方 GitHub URL；未下载、安装、执行、集成源码。部分项目命名和默认分支可能随时间变化，实际 PoC 前核对维护状态、上游 release/tag、许可证及依赖。

## 新增项目表

| 排名 | 项目 | 技术方向 | 对 TokenRouter/智脑的用处 | 风险或验证重点 |
|---|---|---|---|---|
| 11 | [CursorTouch/Windows-MCP](https://github.com/CursorTouch/Windows-MCP) | Windows GUI MCP | Windows 用户端自动操作、截图/应用控件 | 本机权限过大，必须沙箱 |
| 12 | [trycua/cua](https://github.com/trycua/cua) | Computer Use infrastructure | 隔离桌面、Agent 操作环境 | 虚拟化资源与安全 |
| 13 | [web-infra-dev/midscene](https://github.com/web-infra-dev/midscene) | 视觉 GUI 自动化测试 | TokenRouter UI 回归/演示自动操作 | 视觉坐标不稳定 |
| 14 | [browser-use/browser-use](https://github.com/browser-use/browser-use) | 浏览器 Agent | 自动化官网/竞品调查 | 页面注入和凭据保护 |
| 15 | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) | 浏览器 MCP | 网页结构化交互、后台 UI 测试 | 浏览器权限与登录态 |
| 16 | [microsoft/OmniParser](https://github.com/microsoft/OmniParser) | 屏幕解析 | 为视觉 Agent 提供控件定位 | 视觉准确率需评估 |
| 17 | [microsoft/UFO](https://github.com/microsoft/UFO) | Windows GUI Agent | Windows 桌面任务规划与操作 | 兼容性与高权限操作 |
| 18 | [microsoft/markitdown](https://github.com/microsoft/markitdown) | 文件转换 | 知识库文档预处理 | 格式保真及表格缺失 |
| 19 | [microsoft/graphrag](https://github.com/microsoft/graphrag) | GraphRAG | 多文档关系与全局检索 | 索引计算与模型成本 |
| 20 | [modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) | MCP 工具参考实现 | Agent 工具开发规范 | 示例服务不能直接暴露生产 |
| 21 | [mcp-use/mcp-use](https://github.com/mcp-use/mcp-use) | MCP Agent SDK | 集成 Agent 与 MCP 工具 | 版本与运行时适配 |
| 22 | [microsoft/autogen](https://github.com/microsoft/autogen) | 多 Agent 框架 | 多 Agent 协同试验 | 框架演变与升级维护 |
| 23 | [langchain-ai/langgraph](https://github.com/langchain-ai/langgraph) | 有状态 Agent 编排 | 智脑复杂流程/人工审批 | 状态存储复杂度 |
| 24 | [crewAIInc/crewAI](https://github.com/crewAIInc/crewAI) | 多 Agent 编排 | 任务拆分与业务 Agent 协作 | 额外编排成本 |
| 25 | [pydantic/pydantic-ai](https://github.com/pydantic/pydantic-ai) | 类型安全 Agent | 受约束工具调用和模型接口 | SDK 生态适配 |
| 26 | [opendatalab/MinerU](https://github.com/opendatalab/MinerU) | 文档解析 | 复杂 PDF/版式/公式解析 | 资源成本和模型许可 |
| 27 | [docling-project/docling](https://github.com/docling-project/docling) | 文档解析 | 知识库多格式资料提取 | 中文扫描件实测 |
| 28 | [run-llama/llama_index](https://github.com/run-llama/llama_index) | RAG 开发框架 | 智脑数据接入和检索组件 | 依赖范围和维护 |
| 29 | [sgl-project/sglang](https://github.com/sgl-project/sglang) | 模型推理 | GPU 推理加速与批处理 | CUDA/量化兼容性 |
| 30 | [open-webui/pipelines](https://github.com/open-webui/pipelines) | 模型处理流水线 | 网关前后处理与扩展架构参考 | 功能叠加与性能开销 |

## Computer Use 与 Windows MCP 的区别

- **Computer Use（计算机操作）是能力类别**：AI 根据截图、可访问性树或窗口结构理解桌面，然后操作鼠标、键盘、应用、浏览器等；不代表某个唯一产品。
- **Windows MCP 通常是工具桥接层**：把 Windows 截屏、窗口、控件、鼠标键盘、文件等能力按 Model Context Protocol 暴露给 MCP Client/Agent；它本身并不必然拥有自主规划智能。
- **两者可以叠加**：Agent 负责目标分解与视觉判断 → MCP 客户端调用 Windows MCP 服务 → Windows 上实际执行 → 截图或结构化反馈给模型。
- 对你们更适合的场景：Windows 桌面 AI 接入教程自动验收、TokenRouter Admin UI 自动回归、WorkBuddy/Chatbox 接入测试、售前演示自动执行。首选只读截图与窗口检查，其次沙箱下允许鼠标/键盘；绝不默认开放终端、PowerShell 和管理员权限。

## 推荐优先级

**P0：** CursorTouch/Windows-MCP、microsoft/playwright-mcp、web-infra-dev/midscene、trycua/cua、opendatalab/MinerU。
**P1：** browser-use/browser-use、microsoft/UFO、microsoft/OmniParser、langchain-ai/langgraph、docling-project/docling、sgl-project/sglang。
**研究储备：** 其余项目。

## 最小验收用例

1. Windows MCP：普通用户权限读取活动窗口标题、截图；操作测试记事本；检查是否能禁用键盘/PowerShell 和阻止访问非允许目录。
2. Computer Use：隔离 VM 中，Agent 根据截图完成“打开本地测试页面 → 复制一把测试 API Key → 向测试接口发请求 → 判断返回 OK”，不得接触真实 Key。
3. Midscene/Playwright MCP：对 TokenRouter 测试后台跑登录、创建测试密钥、模型列表查看、用量记录验证的自动化用例，并截图留档。
4. MinerU/Docling：对智脑十份脱敏文档抽取文本、表格、引用与 OCR 数据，计算准确率和吞吐。
5. SGLang：与现有推理框架在相同驱动/硬件/模型/精度/并发条件下比较 TTFT、tok/s、VRAM、错误率。

## 许可证及安全检查（未完成）

这些仓库的实际开源许可需要对**所选 SHA**逐项检查 LICENSE/NOTICE、子目录、模型权重及运行依赖。尤其注意：Windows GUI/PowerShell 工具需要极高的本机操作权限；下载到 GitHub 不代表可商用、可嵌入或安全可执行。不要将此项目列表视为许可证认证。
