pragma solidity ^0.4.15;

import './Decimal.sol';

contract TestDecimal {
  using Decimal for Decimal.Data;

  function foo() public constant returns(uint) {
    Decimal.Data memory a = Decimal.fromUint(5);
    Decimal.Data memory b = Decimal.Data({
      num: 12,
      den: 3
    });

    return a.add(b).toUint(); // 9
  }
}
