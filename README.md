# 晨羽 AI 技术研究库 | ChenYu AI Research

> 服务于 **TokenRouter · 晨羽智脑 (ChenYu Brain) · AI 服务器 / 私有化部署** 的开源技术研究与集成评估。
>
> 当前收录 **31 个上游 GitHub 项目**；本仓库保存研究文档、链接及按需获取源码的脚本，**没有镜像或复制第三方源代码**。
> 研究资料尚未构成部署、兼容、商用授权或安全合规认证。

## 快速入口

| 主题 | 入口 | 内容 |
| --- | --- | --- |
| 技术导航 | [按产品能力分类](research/category-index.md) | Agent、Computer Use、模型网关、RAG、推理部署 |
| 第一批 10 项 | [架构与商业价值](research/project-landscape.md) | LiteLLM、Langfuse、RAGFlow 等 |
| 第二批 20 项 | [Computer Use 与 Windows MCP 专题](research/additional-20-computer-use.md) | Windows GUI、浏览器 MCP、Agent、OCR 等 |
| 第 31 项 | [iPhone Use 专题](research/iphone-use.md) | AI 控制 iPhone 的研究和风险 |
| PoC | [最小验证计划](research/validation-plan.md) | 网关、可观测性、知识解析 |
| 风险 | [许可与集成冲突](research/license-and-conflicts.md) | 商用、技术、安全核查清单 |
| 代码引用 | [原始 10 项](third_party/source-references.tsv) · [新增 21 项](third_party/source-references-extra.tsv) | 官方 Git URL，不含第三方源码 |

## 推荐路线

- **TokenRouter**：先研究 LiteLLM 协议兼容、Langfuse 调用追踪、Windows-MCP / Playwright MCP 接入验证。
- **晨羽智脑**：优先验证 RAGFlow、MinerU、Docling 文档解析；对标 Dify / LangGraph 的 Agent 流程。
- **AI 服务器**：按 GPU、驱动、模型和精度实测 vLLM / SGLang；研究 Cua 的隔离执行环境。
- **移动端研究**：评估 iPhone Use 的设备控制边界，先用测试手机和测试账号。

## 如何使用

1. 先阅读 [分类索引](research/category-index.md) 选择项目，再阅读许可证/安全约束。
2. 下载前人工确认上游仓库、LICENSE、tag/commit 和依赖；**不要向第三方项目提交生产密钥或客户数据**。
3. 第一批 10 项可用 Git Bash 执行 `bash third_party/fetch-sources.sh <项目名>`（源码保存到已忽略目录）。
4. 第二批 21 项使用 [源码引用清单](third_party/source-references-extra.tsv) 中的链接按需手动获取；脚本暂不支持这一批。
5. 在隔离环境运行 PoC，通过后再决定是否整合到产品。

## 状态与维护

- 更新日期：2026-10-10
- 研究记录：31 个；代码引入：0；实机验收：尚未完成
- 当前分支是研究 PR，**不修改生产业务代码**
- 合并到 `main` 需要仓库维护者审核 PR。
