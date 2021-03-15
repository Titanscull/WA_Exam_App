//
//  UserAPIManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 14.03.2021.
//

import Foundation

class UserAPIManager: UserEndPointProtocol {
   
    static let shared = UserAPIManager()
    
    private init() { }
   
    private let session: UserEndPointProtocol = UserParseManager()
    
    func signIn(userName: String, password: String) {
        session.signIn(userName: userName, password: password)
    }
    
    func createUser(name: String, surname: String, userName: String, password: String) {
        session.createUser(name: name, surname: surname, userName: userName, password: password)
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
        session.readUser(completion: completion)
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
