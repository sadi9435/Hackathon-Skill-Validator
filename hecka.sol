// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hackathon {
    struct Participant {
        string name;
        bool knowsHTML;
        bool knowsCSS;
        bool knowsJavaScript;
    }

    mapping(address => Participant) public participants;

    function registerParticipant(string memory _name, bool _knowsHTML, bool _knowsCSS, bool _knowsJavaScript) public {
        require(_knowsHTML, "Participant must know HTML.");
        require(_knowsCSS, "Participant must know CSS.");
        require(_knowsJavaScript, "Participant must know JavaScript.");

        participants[msg.sender] = Participant({
            name: _name,
            knowsHTML: _knowsHTML,
            knowsCSS: _knowsCSS,
            knowsJavaScript: _knowsJavaScript
        });
    }

    function checkEligibility(address _participant) public view returns (bool) {
        Participant memory p = participants[_participant];
        return p.knowsHTML && p.knowsCSS && p.knowsJavaScript;
    }
}
