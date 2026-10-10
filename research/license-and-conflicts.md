# 许可证与潜在冲突审查（初步，不构成法律意见）

日期：2026-10-10。检查的是上游仓库公开许可信息与项目声明；**没有完成锁定版本的依赖许可证扫描、SBOM、代码安全审计或法务批准**。

| 项目 | 上游许可/关注点 | 对晨羽商业产品的建议 |
| --- | --- | --- |
| LiteLLM | 核心源代码通常以 MIT 许可发布；功能组件和商用版本可能有不同条款 | 对具体 tag 和相关目录做许可复核 |
| Langfuse | 开源核心 MIT，商业/企业特性另行授权 | 不能把 Enterprise 功能当成可免费再分发 |
| RAGFlow | Apache-2.0（按所选版本复核） | 保留版权、许可与 NOTICE，审计依赖 |
| New API | AGPLv3，NOTICE 中含第 7 节署名要求 | **高风险**：闭源修改、网络提供服务和品牌处理须单独法务审查 |
| Dify | Dify Open Source License（Apache-2.0 基础上有附加条款） | **高风险**：多租户 SaaS / 前端品牌限制，禁止未经审核嵌入或白标 |
| n8n | Sustainable Use License；部分文件为商业许可证 | **高风险**：独立运行与商用产品嵌入/转售是不同问题 |
| vLLM | Apache-2.0（按版本复核） | 核对模型权重、驱动、第三方依赖另行授权 |
| OpenHands | 主仓库 MIT（按具体版本复核） | SDK、工具和模型另核；隔离代码执行环境 |
| Open WebUI | 当前自定义许可含品牌保留条款及例外 | **高风险**：禁止直接替换品牌后作为晨羽产品销售 |
| One API | 版本与分支对应许可须再核对 | 在未审查前只引用链接与架构说明 |

## 上游许可来源

- LiteLLM: https://github.com/BerriAI/litellm/blob/main/LICENSE
- Langfuse: https://github.com/langfuse/langfuse/blob/main/LICENSE
- RAGFlow: https://github.com/infiniflow/ragflow/blob/main/LICENSE
- New API: https://github.com/QuantumNous/new-api/blob/main/LICENSE 和 https://github.com/QuantumNous/new-api/blob/main/NOTICE
- Dify: https://github.com/langgenius/dify/blob/main/LICENSE
- n8n: https://github.com/n8n-io/n8n/blob/master/LICENSE.md
- vLLM: https://github.com/vllm-project/vllm/blob/main/LICENSE
- OpenHands: https://github.com/OpenHands/OpenHands/blob/main/LICENSE
- Open WebUI: https://github.com/open-webui/open-webui/blob/main/LICENSE
- One API: https://github.com/songquanpeng/one-api （确认具体版本许可）

## 潜在技术冲突

1. **功能重叠**：LiteLLM、New API、One API 与 TokenRouter 的路由/用量/鉴权重复；严禁三重计费和未经定义的重试。
2. **数据主权**：Langfuse Trace、RAGFlow 索引、Dify/n8n 工作流数据必须保持部署范围内，不应把客户 Prompt/原件发往未经授权的云服务。
3. **权限边界**：OpenHands 等 Agent 的文件、网络、容器和 GitHub 权限必须最小化，禁止生产级 Token 和主机特权。
4. **服务依赖**：Langfuse/RAGFlow/Dify/n8n 往往需要数据库、缓存、队列或检索组件；避免与现有 MySQL/Redis/MinIO/K3s 版本及端口冲突。
5. **协议重复转换**：TokenRouter 与额外代理同时修改 role、tool_calls、stream、usage 时可能导致不兼容或重复统计。
6. **模型与 GPU 许可**：vLLM 代码许可不等于模型权重或训练数据许可；GPU 驱动和 CUDA 兼容性须实机验证。
7. **品牌和分发**：使用 Open WebUI、Dify 等前端前须看当前许可证，研究 UI 不等于允许复制 UI。

## 合规放行检查表

- [ ] 固定第三方 release/tag/commit SHA
- [ ] 核对该版本顶层 LICENSE、NOTICE、子组件及依赖
- [ ] 生成并保存 SBOM、CVE 扫描报告
- [ ] 检查商用、修改、网络提供服务、再分发和品牌限制
- [ ] 完成敏感数据和出网路径审计
- [ ] 完成隔离环境性能/回归测试
- [ ] 法务、安全与研发明确批准后才进入产品集成

此 PR 仅提交文档、上游链接与**手动拉取**脚本，不包含任意第三方源文件，不增加构建和运行依赖。