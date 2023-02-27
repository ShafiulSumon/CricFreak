//
//  WebKitVC.swift
//  CricFreak
//
//  Created by Admin on 25/2/23.
//

import UIKit
import WebKit

class WebKitVC: UIViewController {
    
//MARK: - Variables
    var forURL: String?
    
//MARK: - Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
        guard let url = URL(string: forURL ?? "") else { return }
        webView.load(URLRequest(url: url))
    }
    
//MARK: - Will Appear
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
        UIApplication.shared.statusBarStyle = .default
    }
    
//MARK: - Will Disappear
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
        UIApplication.shared.statusBarStyle = .lightContent
    }
}
