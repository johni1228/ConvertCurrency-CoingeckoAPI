// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Convert {

  using SafeMath for uint256;

  AggregatorV3Interface public priceFeed;

  constructor() {
    priceFeed = AggregatorV3Interface(0xFF3EEb22B5E3dE6e705b44749C2559d704923FD7);
  }

  function getCurrentPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
  }

  function getDecimals() public view returns (uint8) {
    uint8 decimals = priceFeed.decimals();
    return decimals;
  }

  function convertCurrency(uint256 _amount) external view returns (uint256 ) {
    uint256 price = uint256(getCurrentPrice());
    uint256 amount = _amount.div(price);
    return amount.mul(uint256(getDecimals()));
  }
}