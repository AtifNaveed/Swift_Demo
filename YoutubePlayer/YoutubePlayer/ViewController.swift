//
//  ViewController.swift
//  YoutubePlayer
//
//  Created by Atif on 21/03/2019.
//  Copyright © 2019 atif.gcucs@gmail.com. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var activityIndicatorView: NVActivityIndicatorView?
    
    private var exampleContent: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
    }
    
    func setup() {
        let embeded = "https://www.youtube.com/embed/"
        let watch = "https://www.youtube.com/watch?v="
        let videoId = "M7lc1UVf-VE"
        exampleContent = ["\(embeded)\(videoId)",
                        "\(watch)\(videoId)",
        "https://vid.alarabiya.net/2019/03/14/FO-031419ADC/FO-031419ADC___FO-031419ADC_video.webm"]
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.reloadData()
        
        activityIndicatorView = NVActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100), type: .ballSpinFadeLoader, color: .red, padding: nil)
        activityIndicatorView?.center = view.center
        self.view.addSubview(activityIndicatorView!)
        activityIndicatorView?.startAnimating()
        self.view.isUserInteractionEnabled = false
        perform(#selector(stopActivityIndicator), with: nil, afterDelay: 2.0)
    }
    
    @objc
    func relaodTable() {
        tableView.reloadData()
    }
    
    deinit {
        tableView?.delegate = nil
        tableView?.dataSource = nil
    }
    
    @objc
    func stopActivityIndicator() {
        activityIndicatorView?.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = exampleContent[indexPath.row]
        
        let youtubeVideoCell = tableView.dequeueReusableCell(withIdentifier: "YoutubeVideoCell", for: indexPath) as! YoutubeVideoCell
        DispatchQueue.main.async(execute: { () -> Void in
            let url:URL = URL(string: content)!
            let youtubeRequest = URLRequest(url: url)
            youtubeVideoCell.webView.load(youtubeRequest)
        })
        return youtubeVideoCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



