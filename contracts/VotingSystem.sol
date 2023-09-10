// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract VotingSystem {
    // Structure to represent a candidate
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // Mapping to store candidates
    mapping(uint256 => Candidate) public candidates;

    // Mapping to store voter's eligibility
    mapping(address => bool) public voters;

    // Variable to keep track of the total number of candidates
    uint256 public candidatesCount;

    // Event to notify when a vote is cast
    event Voted(uint256 candidateId);

    // Constructor to initialize candidates
    constructor(string[] memory _candidateNames) {
        candidatesCount = 0;
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates[i + 1] = Candidate(i + 1, _candidateNames[i], 0);
            candidatesCount++;
        }
    }

    // Function to cast a vote for a candidate
    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender], "You have already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        candidates[_candidateId].voteCount++;
        voters[msg.sender] = true;
        emit Voted(_candidateId);
    }

    // Function to get the details of a candidate
    function getCandidate(uint256 _candidateId) public view returns (uint256, string memory, uint256) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.id, candidate.name, candidate.voteCount);
    }
}