//SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;
abstract contract ERC20 {
    function transfer(address _from, uint256 _value) external{}
    function decimals()external view returns(uint8){}
}
contract TokenSale {
    uint tokenPriceInWei = 1 ether;

    ERC20 token;

    constructor(address _token) {
        token = ERC20(_token);
    }
        function purchaseCoffee()public payable {
            require(msg.value >= tokenPriceInWei,"Not Enough Money Sent");
            uint tokensToTransfer = msg.value  / tokenPriceInWei;
            uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
            token.transfer( msg.sender, tokensToTransfer*10** token.decimals());
                payable(msg.sender).transfer(remainder);
            }

}
