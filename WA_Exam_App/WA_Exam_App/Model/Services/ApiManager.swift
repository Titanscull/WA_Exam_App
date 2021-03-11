//
//  ApiManager.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

enum EndpointAPI: String {
    case popularVideos = "https://api.pexels.com/videos/popular"
    case searchVideos = "https://api.pexels.com/videos/search"
    case getVideo = "https://api.pexels.com/videos/videos/:id"
    case curatedPhotos = "https://api.pexels.com/v1/curated"
    case searchPhotos = "https://api.pexels.com/v1/search"
    case getPhoto = "https://api.pexels.com/v1/photos/:id"
}

class ApiManager {
    
    private let apiKey = "563492ad6f9170000100000126a561c26bd84e81b21ed68b3a06ce81"
    private let networkManager = NetworkManager()
    
    // formation and processing the request (get, decode json ...)
    
    func getPopularVideos(completion: (() -> ())?) {
        networkManager.performRequest(url: EndpointAPI.popularVideos.rawValue, method: .get, key: apiKey, params: [:], success: { [weak self] (data) in
            let popular = self?.convert(data: data)
        }) { (error) in
            print(error?.localizedDescription)
        }
    }
    
    func convert(data: Data) -> PopularVideos? {
        
        do {
            let popular = try JSONDecoder().decode(PopularVideos.self, from: data) // ERROR - The data couldn’t be read because it isn’t in the correct format.
            return popular
        } catch {
            return nil
        }
        
    }
    
}
