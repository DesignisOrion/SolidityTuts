const gldnfToken = artifacts.require("gldnfToken");

module.exports = function(deployer) {
  deployer.deploy(gldnfToken);
};
