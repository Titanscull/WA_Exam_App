//
//  UserAPIManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 14.03.2021.
//

import Foundation

class UserAPIManager: UserEndPointProtocol {
   
    private let session: UserEndPointProtocol = UserParseManager()
    
    func createUser(name: String, surName: String, userName: String, password: String) {
//        session.createUser(completion: completion)
        session.createUser(name: name, surName: surName, userName: userName, password: password)
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
        session.readUser(completion: completion)
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
