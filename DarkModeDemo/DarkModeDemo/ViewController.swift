//
//  ViewController.swift
//  DarkModeDemo
//
//  Created by Atif on 21/10/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHelloWorld: UILabel!
    @IBOutlet var bg: UIView!
    
    let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case
          .unspecified,
          .light:
            return .white
        case .dark:
            return .black
        @unknown default:
            return .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bg.backgroundColor = dynamicColor
        lblHelloWorld.textColor = .label
    }

    

}



