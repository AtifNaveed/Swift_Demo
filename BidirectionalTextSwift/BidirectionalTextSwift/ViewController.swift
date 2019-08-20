//
//  ViewController.swift
//  New
//
//  Created by Atif on 20/08/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        let attStr = NSAttributedString(string: lblText.text!, attributes: [.foregroundColor : UIColor.white, .writingDirection: [NSWritingDirection.rightToLeft.rawValue]])
//        lblText.attributedText = attStr


        let str = "\"STC Atif Naveed\" تعلن عدم الاستمرار في اتفاقية نقل ورعاية الدوري السعودي \"لعدم جدواها تجاريا\""
        let subAttr: [NSAttributedString.Key : Any] = [.writingDirection : [ NSNumber(value: NSWritingDirection.rightToLeft.rawValue)]]
        let attStr = NSAttributedString(string: str, attributes: subAttr)
        lblText.attributedText = attStr
        
        
        for scalar in str.unicodeScalars {
            print("\(scalar) ")
        }
        
        
//        for scalar in str.unicodeScalars {
//            print("\(scalar.value) ", terminator: "")
//        }
//        print("")
    }
}
