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
    private var videos = [Video]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "ContentCell", bundle: nil), forCellWithReuseIdentifier: "ContentCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        apiManager.getVideos { [weak self] arrayVideos in
            guard let self = self else { return }
            
            self.videos = arrayVideos
            
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
            detailVC?.url = cell.urlVideo
        }
 
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let totalElements = Double(videos.count)
        if indexPath.row >= Int((totalElements / 100.0 * 70.0)) {
            loadMoreContent()
        }
    }
    
    func loadMoreContent() {
        apiManager.getMoreVideos { [weak self] arrayVideos in
            guard let self = self else { return }
            
            for element in arrayVideos {
                self.videos.append(element)
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension VideosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCell", for: indexPath) as! ContentCell
        cell.setupVideoCell(video: videos[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.0, height: UIScreen.main.bounds.width / 2.0)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}
