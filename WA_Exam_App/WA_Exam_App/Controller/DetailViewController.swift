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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.loadFileURL(URL(fileURLWithPath: "https://www.pexels.com/video/2499611/"), allowingReadAccessTo: URL(fileURLWithPath: "https://www.pexels.com/video/2499611/"))
    }
}
