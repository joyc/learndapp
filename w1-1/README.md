# w1-1 task
W1-1作业：
- 安装 Metamask、并创建好账号
- 执行一次转账
- 使用 Remix 创建任意一个合约
- VSCode IDE 开发环境配置
- 使用 Truffle 部署 Counter 合约 到 test 网络（goerli）（提交交易 hash）
- 编写一个测试用例

作业要求：
1. 使用自己的 github 创建一个作业代码库
2. 每一次作业使用一个文件夹(w1) 
3. 提交代码、截图、交易 hash 等

```sol
pragma solidity ^0.8.0;

contract Counter {
    uint public counter;
    constructor() {
        counter = 0;
    }
    function count() public {
        counter++;
    }
}

```