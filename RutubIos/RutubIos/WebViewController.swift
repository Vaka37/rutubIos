//
//  WebViewController.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKNavigationDelegate, UISearchBarDelegate {
    
    private let webView = WKWebView()
    
    private lazy var nameLabel = UILabel()
    private lazy var authorLabel = UILabel()
    private lazy var dateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    func setUpLabel(text: String, author: String, date: String) {
           createLabel(label: nameLabel, y: 250, tetx: text)
        createLabel(label: authorLabel, y: 280, tetx:"Автор: \(author)")
        createDateLabel(label: dateLabel, text: date)
       }
    
    func createWeb(url: String) {
        webView.navigationDelegate = self
        webView.loadHTMLString(url, baseURL: nil)
        view = webView
    }
    
    
    private func createLabel(label: UILabel, y: Int, tetx: String) {
        label.frame = CGRect(x: 10, y: y, width: 270, height: 30)
        label.text = tetx
        webView.addSubview(label)
    }
    
    private func createDateLabel(label: UILabel, text: String) {
        label.frame = CGRect(x: 10, y: 310, width: 270, height: 30)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let dareFormaterPrint = DateFormatter()
        dareFormaterPrint.dateFormat = "MMM d, h:mm a"
        if let date = dateFormatter.date(from: text) {
            label.text = dareFormaterPrint.string(from: date)
        }
        webView.addSubview(label)
    }
}
