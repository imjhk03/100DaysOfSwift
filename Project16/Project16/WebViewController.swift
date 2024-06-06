//
//  WebViewController.swift
//  Project16
//
//  Created by Joohee Kim on 6/6/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    var capital: Capital?
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let capital else { return }
        
        let urlString = capital.wikipedia
        if let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            webView.load(urlRequest)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
