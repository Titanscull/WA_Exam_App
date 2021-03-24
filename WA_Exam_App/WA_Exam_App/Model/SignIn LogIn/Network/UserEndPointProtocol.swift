//
//  UserEndPointProtocol.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 12.03.2021.
//

import Foundation
import Parse


protocol UserEndPointProtocol: class {
    
    func createUser(name: String, surname: String, username: String, password: String, completion: @escaping ((User) -> Void))
    func readUser(completion: @escaping (([User]) -> Void))
    func deleteUser(user: User)
    func updateUser(user: User)
    func retrieveUser()
    func signIn(username: String, password: String)
    func logout()
    
}
