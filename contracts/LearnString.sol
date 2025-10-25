// SPDX-License-Identifier: MIT (wajib agar mengetahui project open source)

pragma solidity ^0.8.30; 


// dalam block 
contract LearnString {
    // Variabel string untuk menyimpan nama tanaman
    string public plantName;

    // Constructor mengatur nilai awal
    constructor() {
        plantName = "BungaLele";
    }

    // Fungsi untuk mengubah nama
    function changeName(string memory _newName) public {
        plantName = _newName;
    }
}

// Environment itu mau deploy di jaringan mana