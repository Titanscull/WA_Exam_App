//
//  NetworkManager.swift
//  WA_Exam_App
//
//  Created by Blashko Maksim on 08.03.2021.
//

import Foundation

enum MethodAPI: String {
    case get = "GET"
    case post = "POST"
}

class NetworkManager {
    
    // processing the request result
    
    func performRequest(url: String, method: MethodAPI, key: String, params: [String: Any], success: ((Data) -> ())?, failure: ((Error?) -> ())?) {
        
        guard let url = URL(string: url) else { failure?(nil); return }
       
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(key, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let error = error { failure?(error)
                return }
            
            if let data = data {
                success?(data)
            } else {
                failure?(nil)
            }
            
        }.resume()
    }
    
}
