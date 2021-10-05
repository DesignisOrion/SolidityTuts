const culturecoin = artifacts.require("culturecoin");

module.exports = function(deployer) {
  deployer.deploy(culturecoin);
};
