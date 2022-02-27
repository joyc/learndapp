# 第一周 W1-1
- ## 什么是以太坊
	- 一台世界计算机(去中心化，任何人都可以用)
	- 一个状态机(由交易触发的状态转换系统)
	- 一个智能合约
		- 智能：可执行
		- 合约：协议，规则
	- EVM
		- 类似Java的JVM
		- EVM是一个封闭环境，不能访问外部系统
		- EVM兼容链：BSC、Polygon、OEC、Fantom...
- ## 以太坊客户端
	- 以太坊客户端：EVM载体，网络中的节点程序
	- 只要符合网络规范，几乎任何语言都可以实现客户端
	- 常见客户端：Geth(Go实现)、OpenEthereum(Rust实现)
	- 通过RPC提供服务
- ## 账户
	- 外部账户(EOA)：由私钥控制，需妥善保管不能恢复
	- 合约账户：代码控制
	- 两者在EVM层面是等效的
	- 区别
		- **交易**只能从外部账号发出，合约只能被动相应执行
		- 合约之间的交互通常称为**消息**，所有的gas由外部账号支付
        - 合约之间的调用不需再支付gas 是因为由外部账户(用户)发出的才是交易，才需要支付gas
- ## 钱包
	- 通常使用一个钱包来创建账号
		- 热钱包和冷钱包
		  联网与否的区别
	- 常用：Metamask、imToken、TrustWallet
- ## GAS
	- EVM的计价规则，也防止图灵死机问题
	- GAS是一个工作量单位，复杂度越大所需gas越多
	- 费用 = gas数量 x gas单价 (以太币计价单位gwei)
		- 单位：最小单位Wei(伟)
			- $10^9 Wei = 1 Gwei$
			- $10^{12} Wei = 1 szabo$ (萨博)
			- $10^{15} Wei = 1 finey$ (芬妮)
			- $10^{18} Wei = 1 Ether$
- ## 网络
	- 主网(价值网络)：https://cn.etherscan.com/
	- 测试网：https://goerli.etherscan.io/
	- 开发模拟网：本地网络

- ## 开发工具
	- [Remix](https://remix.ethereum.org/)
		- 本地文件管理插件：[remixd](https://github.com/ethereum/remix-project/tree/master/libs/remixd)
		  安装：`npm install -g @remix-project/remixd`
		  共享文件：`remixd -s <absolute-path> --remix-ide https://remix.ethereum.org`
	- [Truffle](https://trufflesuite.com/truffle/)：编译、部署、测试合约的一整套开发工具
		- [中文文档](https://learnblockchain.cn/docs/truffle/index.html)
		- 工程结构
			- contracts：智能合约目录
			- Migrations：迁移文件、用来指示如何部署智能合约
			- tests：智能合约测试用例文件
			- truffle-config.js：配置文件，配置truffle连接的网络及编译选项
		-
		- 合约的部署
			- 步骤：配置网络→编写部署脚本→启动网络(本地)→执行部署
			- 部署命令：`truffle migrate [ -f 序号 -network 网络]`
			- 部署后再`Ganache`中可以查看到相关的交易
			- 部署信息如合约地址也会写入之前编译生成的构建文件`build/contracts`中
		- 合约的测试
			- 支持使用Solidity、javaScript和TypeScript
			- 命令：`truffle test ./path/to/test/file.js`
			- 执行测试某逻辑代码：`truffle exec scripts/test.js`
		- 常用命令
		  Compile contracts: `truffle compile`
		  Migrate contracts: `truffle migrate`
		  Test contracts:    `truffle test`
		- Tips
			- `truffle console`可以直接在控制台调用合约
			- `Truffle-min.sh` ：压缩`artifacts`文件

	- [Ganache](https://trufflesuite.com/ganache/index.html)：开发区块链，提供本地模拟的链上环境

## 作业
### W1-1作业：  
> 安装 Metamask、并创建好账号  
> 执行一次转账  
> 使用 Remix 创建任意一个合约  
> VSCode IDE 开发环境配置  
> 使用 Truffle 部署 Counter 合约 到 test 网络（提交交易 hash）  
> 编写一个测试用例

- Metamask账户及转账
    - ![b4T2M13](https://i.imgur.com/b4T2M13.png)
- 交易转账记录：[Transaction Hash](https://ropsten.etherscan.io/tx/0xf41885b863184ec1a5d7ec221adbc9918c68fc8eff55136f6a6e02f06c8d35c2)
- Remix合约部署
    - ![lNnymw7](https://i.imgur.com/lNnymw7.png)
- 部署的合约地址：[ropsten](https://ropsten.etherscan.io/address/0x7be41cc39cac38760abeebadb504ffefc0d32bf1)
- truffle部署counter地址：[ropsten](https://ropsten.etherscan.io/address/0x5DD2f310D79dBC712007dBF1f34540bEa4fb7cb9)
