//
//  CustomTabViewController.swift
//  DarkModeDemo
//
//  Created by Atif on 27/10/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class CustomTabViewController: UITabBarController {

    let dynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
         switch traitCollection.userInterfaceStyle {
         case
           .unspecified,
           .light:
             return .black
         case .dark:
             return .white
         @unknown default:
             return .black
         }
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.tintColor = dynamicColor
    }
    

}
