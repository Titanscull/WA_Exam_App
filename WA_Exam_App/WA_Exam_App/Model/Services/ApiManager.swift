//
//  ApiManager.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

enum EndpointAPI: String {
    case popularVideos = "https://api.pexels.com/videos/popular?per_page=40"
    case searchVideos = "https://api.pexels.com/videos/search"
    case getVideo = "https://api.pexels.com/videos/videos/:id"
    case curatedPhotos = "https://api.pexels.com/v1/curated?per_page=40"
    case searchPhotos = "https://api.pexels.com/v1/search"
    case getPhoto = "https://api.pexels.com/v1/photos/:id"
}

class ApiManager {
    
    private let apiKey = "563492ad6f9170000100000126a561c26bd84e81b21ed68b3a06ce81"
    private let networkManager = NetworkManager.shared
    static let shared = ApiManager()
    private init() { }
    
    // formation and processing the request (get, decode json ...)
    
    func getVideos(completion: @escaping (([Video]) -> Void)) {
        networkManager.performRequest(url: EndpointAPI.popularVideos.rawValue, method: .get, key: apiKey, success: { (data) in
            
            do {
                let decodeData = try JSONDecoder().decode(PopularVideos.self, from: data)
                completion(decodeData.videos)
                //print(decodeData)
            } catch {
                print(error.localizedDescription)
            }
            
        }) { (error) in
            print(error?.localizedDescription as Any)
        }
    }
    
    func getPhotos(completion: @escaping (([Photo]) -> Void)) {
        networkManager.performRequest(url: EndpointAPI.curatedPhotos.rawValue, method: .get, key: apiKey, success: { (data) in
            
            do {
                let decodeData = try JSONDecoder().decode(CuratedPhotos.self, from: data)
                completion(decodeData.photos)
                //print(decodeData)
            } catch {
                print(error.localizedDescription)
            }
            
        }) { (error) in
            print(error?.localizedDescription as Any)
        }
    }
    
}
