## W4 Task
### W4_1作业  

部署自己的 `ERC20` 合约 `MyToken`  
编写合约 `MyTokenMarket` 实现：  
- `AddLiquidity()`:函数内部调用 `UniswapV2Router`添加 `MyToken` 与 `ETH` 的流动性
- `buyToken()`：用户可调用该函数实现购买 `MyToken`

---
### W4_2作业  
在上一次作业的基础上：  
- 完成代币兑换后，直接质押 `MasterChef`
- `withdraw()`:从 `MasterChef` 提取 `Token` 方法

---
### 作业提交
4-1 和 4-2 作业在 `W4/hardhat_demo/contracts` 中
- `MyTokenMarket.sol`
- `MyToken.sol`
