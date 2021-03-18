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
    
    
    func loadImage() {
        self.topLabel.text = "test load view"
        if let url = URL(string: "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.imageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
    func loadVideo() {
        self.topLabel.text = "test load view"
        if let url = URL(string: "https://images.pexels.com/videos/1510090/free-video-1510090.jpg?fit=crop&w=1200&h=630&auto=compress&cs=tinysrgb") {
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
