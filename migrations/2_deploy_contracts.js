const SafeMath = artifacts.require("./SafeMath.sol")
const TestDecimal = artifacts.require("./TestDecimal.sol")

module.exports = function(deployer) {
  deployer.deploy(SafeMath)
  deployer.link(SafeMath, TestDecimal)
  deployer.deploy(TestDecimal)
}
