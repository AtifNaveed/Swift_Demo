//
//  ViewController.swift
//  new
//
//  Created by Atif on 17/02/2020.
//  Copyright © 2020 Atif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //TODO Change key and iv before use
    static let key = "aTif@nAvEeDdN_oMaTiFaBduLlAhaTff" // 32 character of your choice
    static let iv = "t@heZbI_aYsHi01o" // 16 character of your choice

    override func viewDidLoad() {
        super.viewDidLoad()

        // Message/Password to encrypt
        var msgToEncrypt  = "My Name is Atif"
        
        // Encryption
        print("Message Before Encryption:                \(msgToEncrypt)")
        do {try msgToEncrypt = msgToEncrypt.aesEncrypt(key: ViewController.key, iv: ViewController.iv)} catch  {print("Error")}
        print("Message After Encryption:                 \(msgToEncrypt)\n")
        var encryptedMsg = msgToEncrypt
        
        
        // Decryption
        print("Encrypted Message Before Decryption:      \(encryptedMsg)")
        do {try encryptedMsg = encryptedMsg.aesDecrypt(key: ViewController.key, iv: ViewController.iv)} catch  {print("Error")}
        print("Encrypted Message After Decryption:       \(encryptedMsg)\n")
    }
}

