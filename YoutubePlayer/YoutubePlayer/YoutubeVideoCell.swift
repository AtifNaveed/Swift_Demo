//
//  YoutubeVideoCell.swift
//  YoutubePlayer
//
//  Created by Atif on 21/03/2019.
//  Copyright © 2019 atif.gcucs@gmail.com. All rights reserved.
//

import UIKit
import WebKit

class YoutubeVideoCell: UITableViewCell {

    @IBOutlet weak var webView: WKWebView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        webView.navigationDelegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


//extension SocialVideoCell: WKNavigationDelegate {
//
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        webView.evaluateJavaScript("document.readyState", completionHandler: { (_, _) in
//            webView.invalidateIntrinsicContentSize()
//        })
//    }
//}





