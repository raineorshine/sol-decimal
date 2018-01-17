pragma solidity ^0.4.15;

import './SafeMath.sol';

/**

A Solidity Decimal type.

Usage:
import "./Decimal.sol";
contract A {
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

*/
library Decimal {

  using SafeMath for uint256;

  /** Creates a Decimal Data from a uint numerator and uint denominator by directly constructing Data. */
  struct Data {
    uint num; // numerator
    uint den; // denomenator
  }

  /** Creates a Decimal Data from a uint. */
  function fromUint(uint num) internal constant returns(Data) {
    return Data({
      num: num,
      den: 1
    });
  }

  /** Converts a Decimal to a uint (effectively flooring the value). **/
  function toUint(Data decimal) internal constant returns(uint) {
    return decimal.num.div(decimal.den);
  }

  /** Adds two Decimals without loss of precision. */
  function add(Data a, Data b) internal constant returns(Data) {

    return a.den == b.den ?
      // if same denomenator, use b.num as-is
      Data({
        num: a.num.add(b.num),
        den: a.den
      }) :
      // otherwise convert (b) to the same denominator as (a)
      Data({
        num: a.num.mul(b.den)
          .add(b.num.mul(a.den)),
        den: a.den * b.den
      });
  }

  /** Subtracts two Decimals without loss of precision. */
  function sub(Data a, Data b) internal constant returns(Data) {

    return a.den == b.den ?
      // if same denomenator, use b.num as-is
      Data({
        num: a.num.sub(b.num),
        den: a.den
      }) :
      // otherwise convert (b) to the same denominator as (a)
      Data({
        num: a.num.mul(b.den)
          .sub(b.num.mul(a.den)),
        den: a.den * b.den
      });
  }

  /** Multiplies two Decimals without loss of precision. */
  function mul(Data a, Data b) internal constant returns(Data) {
    return Data({
      num: a.num.mul(b.num),
      den: a.den.mul(b.den)
    });
  }

  /** Divides two Decimals without loss of precision. */
  function div(Data a, Data b) internal constant returns(Data) {
    return Data({
      num: a.num.mul(b.den),
      den: b.num.mul(a.den)
    });
  }
}
