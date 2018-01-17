A Solidity Decimal type.

## Usage

```js
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
```

## Build

```
testrpc
truffle compile
truffle migrate --reset
truffle test
```
