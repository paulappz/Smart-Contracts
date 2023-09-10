const VotingSystem = artifacts.require("VotingSystem");
const SimpleBank = artifacts.require("SimpleBank");

module.exports = function (deployer) {
  deployer.deploy(VotingSystem, ["Candidate 1", "Candidate 2"]);
  deployer.deploy(SimpleBank);
};
