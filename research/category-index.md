# 31 项 GitHub 技术研究分类索引

> 这是项目选型导航，不代表已集成或经过实机验收。对应源码 URL 在 [前 10 项](../third_party/source-references.tsv) 和 [后 21 项](../third_party/source-references-extra.tsv)。

## 1. TokenRouter：API 网关、路由、观测

- LiteLLM — 多供应商协议适配与路由（首批 P0）
- Langfuse — 调用追踪、质量评估和成本分析（首批 P0）
- New API / One API — 国内模型网关架构与竞品对标
- Open WebUI Pipelines — 模型请求前后处理参考

## 2. Computer Use 与 MCP（桌面、浏览器、移动端）

- Windows-MCP — Windows 桌面操作接口
- Cua — 隔离式计算机操作环境
- Midscene — 视觉 GUI 自动化与回归测试
- Browser Use — 浏览器 Agent
- Playwright MCP — 浏览器自动化工具
- OmniParser — 屏幕控件视觉解析
- UFO — Windows GUI Agent
- MCP Servers / mcp-use — MCP 参考工具与 Agent SDK
- **iPhone Use（第 31 项）** — iPhone 真机控制与移动端自动化；[专项分析](./iphone-use.md)

## 3. 晨羽智脑：RAG、文档和知识库

- RAGFlow — RAG / 文档解析
- Dify — Agent 应用与知识库工作流
- MarkItDown — 文档转 Markdown
- GraphRAG — 图谱关联与知识检索
- MinerU / Docling — 复杂 PDF/版式解析
- LlamaIndex — 数据接入与检索框架

## 4. Agent 开发、任务执行、业务编排

- n8n — 工作流自动化
- OpenHands — 自动编程 Agent
- AutoGen / LangGraph / CrewAI / Pydantic AI — 多 Agent、状态工作流与受约束工具调用

## 5. AI 服务器与推理

- vLLM / SGLang — GPU 推理服务，需设备级实测

## 最值得先做的验证

| 方向 | 首选试验 | 交付结果 |
| --- | --- | --- |
| 协议 | LiteLLM 对照 TokenRouter | 消息/错误/计费兼容矩阵 |
| 观测 | Langfuse 旁路 | Trace/成本/脱敏验证 |
| 文档 | RAGFlow + MinerU | 脱敏样本文档准确率报告 |
| Windows | Windows-MCP + Midscene | UI 接入自动验收 |
| 浏览器 | Playwright MCP | 管理端自动回归 |
| iPhone | iPhone Use 测试机 | 移动端受控操作 PoC |
| 推理 | vLLM + SGLang | 4090D/5090 性能比较 |

## 安全与许可

所有引用均为第三方上游仓库。不同项目可能有 AGPL、MIT、Apache、自定义或附加品牌/商用限制，不能因为它们位于 GitHub 就推定有权商用集成。请先阅读 [许可证和技术冲突](./license-and-conflicts.md)。