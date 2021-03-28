//
//  DetailViewController.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 22.03.2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailView: WKWebView!
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.load(URLRequest(url: URL(string: self.url)!))
    }
}
