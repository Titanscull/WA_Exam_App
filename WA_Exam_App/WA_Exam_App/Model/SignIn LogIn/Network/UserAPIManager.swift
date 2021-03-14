//
//  UserAPIManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 14.03.2021.
//

import Foundation

class UserAPIManager: UserEndPointProtocol {
    
    private let session: UserEndPointProtocol = UserParseManager()
    
    func createUser(name: String, surname: String, userName: String) {
                
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
        session.readUser(completion: completion)
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
