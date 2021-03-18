//
//  PhotosViewController.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 18.03.2021.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let apiManager = ApiManager.shared
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: "ContentCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        apiManager.getPhotos { [weak self] (curatedPhotos) in
            guard let self = self else { return }
            let urlText = curatedPhotos.photos[0].src.tiny
            let url = URL(string: urlText)
        }
        
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.loadImage()
        return cell
    }
}

