//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./IUniswapV2Router01.sol";
import "./MasterChef.sol";

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract MyTokenMarket {
    using SafeERC20 for IERC20;

    address public myToken;
    address public router;
    address public weth;

    constructor(address _token, address _router, address _weth) {
        myToken = _token;
        router = _router;
        weth = _weth;
    }

    // 添加流动性 两种币 Token和 ETH
    function AddLiquidity(uint tokenAmount) external payable {
        IERC20(myToken).safeTransferFrom(msg.sender, address(this),tokenAmount);    // 发送者转给合约
        IERC20(myToken).safeApprove(router, tokenAmount);   // 合约授权路由器转给发送者

        // ingnore slippage
        // (uint amountToken, uint amountETH, uint liquidity) = 
        IUniswapV2Router01(router).addLiquidityETH{value: msg.value}(myToken, 
            tokenAmount, 0, 0, msg.sender, block.timestamp);

        // handle left: 多余的 ETH 返回给用户
        // if (msg.value > amountETH) TransferHelper.safeTransferETH(msg.sender, msg.value - amountETH);
    }

    // 用 ETH 购买 Token
    function buyToken(uint minTokenAmount) external payable {
        address[] memory path = new address[](2);
        path[0] = weth;
        path[1] = myToken;

        IUniswapV2Router01(router).swapExactETHForTokens{value: msg.value}(minTokenAmount, path, msg.sender, block.timestamp);

        // w4-2 完成代币兑换后，直接质押 `MasterChef`
        uint tokenAmount = IERC20(myToken).balanceOf(address(this));
        IERC20(myToken).approve(masterChef, tokenAmount); // 授权 masterChef
        MasterChef(masterChef).deposit(0, tokenAmount);
        // depositAmounts[msg.sender] += tokenAmount; // 存储用户的质押的押金数量
    }

    // w4-2 增加withdraw方法，从MasterChef提取Token
    function withdraw(uint256 _amount) external {
        // 判断用户是否有足够的Token
        require(_amount > 0, 'Withdraw amount must be greater than 0');
        MasterChef(masterChef).withdraw(0, _amount); // 提取到 Market 合约中
        IERC20(myToken).safeApprove(address(this), _amount);
        IERC20(myToken).safeTransfer(msg.sender, _amount); // 转给用户
        // LP 给用户发放代币
        uint sushiTokenAmount = IERC20(MasterChef(masterChef).sushi()).balanceOf(address(this));
        // console.log("sushiTokenAmount:", sushiTokenAmount);
        IERC20(MasterChef(masterChef).sushi()).safeTransfer(msg.sender, sushiTokenAmount);
    }
}