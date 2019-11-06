//
//  ViewController.swift
//  LanguageSetting
//
//  Created by Atif on 15/01/2019.
//  Copyright © 2019 atif.gcucs@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblCurrentLang: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblTitle.textAlignment = .natural
        lblDetail.textAlignment = .natural
    }
    
    @IBAction func actionLang(_ sender: Any) {
        let btn = sender as! UIButton
        switchViewControllers(isArabic: btn.tag == 1 ? false : true)
    }

    
    // Util method
    func switchViewControllers(isArabic arabic : Bool) {
        UIView.appearance().semanticContentAttribute = arabic ? .forceRightToLeft : .forceLeftToRight
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        appDelegate().window?.rootViewController = homeViewController
    }
}


