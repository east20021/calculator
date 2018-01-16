//
//  DetailViewController.swift
//  AutoLayout_calculator
//
//  Created by lee on 2018. 1. 16..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinningIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.apple.com/kr/")
        let requestUrl = URLRequest(url: url!)
        webView.load(requestUrl)
        
        self.webView.navigationDelegate = self
        self.spinningIndicator.startAnimating()
    }
   
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningIndicator.stopAnimating()
        spinningIndicator.isHidden = true
    }
    
}
