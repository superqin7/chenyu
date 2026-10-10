# AI 开源项目研究库

> 更新：2026-10-10。面向 TokenRouter、晨羽智脑（ChenYu Brain）与 AI 服务器的技术选型参考。
> 本目录**不包含第三方代码**，不意味着已经通过兼容性、安全或商用合规验收。

## 文档索引

- [10 个项目的选型与差异分析](./project-landscape.md)
- [许可证与集成冲突检查](./license-and-conflicts.md)
- [分阶段验证与验收计划](./validation-plan.md)
- [上游源码清单](../third_party/source-references.tsv)

## 如何按需获取第三方源码

在本仓库根目录执行（需要 Git 和 Bash）：

```bash
bash third_party/fetch-sources.sh
```

默认下载到未跟踪的 `third_party/checkouts/`（被 .gitignore 忽略），**不会自动安装依赖、执行源码、集成产品或发布**。

也可指定一个项目：
```bash
bash third_party/fetch-sources.sh litellm
```

Windows 建议使用 Git Bash；脚本使用浅克隆以减少下载量。首次拉取的是当时的上游默认分支，而非锁定版本，正式测试须自行固定审核通过的 commit/tag 并记录 SHA。受网络、仓库大小及磁盘限制影响，拉取可能失败。

## 集成原则

1. 优先研究与独立 PoC，不改 TokenRouter / 智脑生产代码。
2. 在沙箱容器或隔离 VM 中测试；不要使用客户真实数据或生产密钥。
3. 许可审核必须针对最终选定的**具体版本及依赖树**进行。
4. 商业打包、分发和提供服务前由法务/安全/研发联合复核。
5. 文档中分数是项目匹配度的初步主观排序，不是兼容性事实。