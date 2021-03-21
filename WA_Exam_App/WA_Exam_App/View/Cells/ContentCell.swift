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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    
    func setupPhotoCell(photo: Photo) {

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
        
        self.topLabel.text = video.user.name
        if let url = URL(string: video.image) {
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
