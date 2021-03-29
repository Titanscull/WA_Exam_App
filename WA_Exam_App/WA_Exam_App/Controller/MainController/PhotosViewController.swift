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
    private var photos = [Photo]()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: "ContentCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        apiManager.getPhotos { [weak self] arrayPhotos in
            guard let self = self else { return }
            
            self.photos = arrayPhotos
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showDetail", sender: self.collectionView.cellForItem(at: indexPath))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let detailVC = segue.destination as? DetailViewController
            guard let cell = sender as? ContentCell else { return }
            detailVC?.url = cell.urlPhoto
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == photos.count - 1 {
//
//        }
    }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.setupPhotoCell(photo: photos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.0, height: UIScreen.main.bounds.width / 2.0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }

}

