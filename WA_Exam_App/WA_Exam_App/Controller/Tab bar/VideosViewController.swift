//
//  VideosViewController.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 18.03.2021.
//

import UIKit

class VideosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let apiManager = ApiManager.shared
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: "ContentCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        apiManager.getVideos { [weak self] (popularVideos) in
            guard let self = self else { return }
        }
    }
}

extension VideosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.loadVideo()
        return cell
    }
    
}
