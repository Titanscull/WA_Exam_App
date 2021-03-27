//
//  DetailViewController.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 22.03.2021.
//

import UIKit
import WebKit
import AVKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // test 1
        detailView.loadFileURL(URL(fileURLWithPath: "https://www.pexels.com/video/2499611/"), allowingReadAccessTo: URL(fileURLWithPath: "https://www.pexels.com/video/2499611/"))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {

        // test 2
        super.viewDidAppear(animated)

        let avVC = AVPlayerViewController()
        let item = AVPlayerItem(asset: AVAsset(url: URL(fileURLWithPath: "https://www.pexels.com/video/2499611/")))
        avVC.player = AVPlayer(playerItem: item)
        avVC.player?.play()
        
        present(avVC, animated: true, completion: nil)
        
   }
}
