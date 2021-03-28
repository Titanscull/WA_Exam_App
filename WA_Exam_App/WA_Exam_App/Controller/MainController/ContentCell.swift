//
//  ContentCell.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 18.03.2021.
//

import UIKit

class ContentCell: UICollectionViewCell {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var urlPhoto: String = ""
    var urlVideo: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    func setupPhotoCell(photo: Photo) {

        self.urlPhoto = photo.src.original 
        self.topLabel.text = photo.photographer
        if let url = URL(string: photo.src.tiny) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.imageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
    func setupVideoCell(video: Video) {
        
        self.urlVideo = video.videoFiles.first?.link ?? ""
        self.topLabel.text = video.user.name
        if let url = URL(string: video.videoPictures.first?.picture ?? video.image) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.imageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
}
