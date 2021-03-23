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
    
    func logout() {
        session.logout()
    }
    
    func retrieveUser() {
        session.retrieveUser()
    }
    
    
    func signIn(username: String, password: String) {
        session.signIn(username: username, password: password)
    }
    
    func createUser(name: String, surname: String, username: String, password: String, completion: @escaping ((User) -> Void)) {
        session.createUser(name: name, surname: surname, username: username, password: password, completion: completion)
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
        session.readUser(completion: completion)
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
