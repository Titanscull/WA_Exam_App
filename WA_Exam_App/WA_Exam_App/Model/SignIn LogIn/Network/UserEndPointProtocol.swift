//
//  UserEndPointProtocol.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 12.03.2021.
//

import Foundation
import Parse


protocol UserEndPointProtocol: class {
    func createUser(name: String, surname: String, userName: String)
    func readUser(completion: @escaping (([User]) -> Void))
    func deleteUser(user: User)
    func updateUser(user: User)
}
