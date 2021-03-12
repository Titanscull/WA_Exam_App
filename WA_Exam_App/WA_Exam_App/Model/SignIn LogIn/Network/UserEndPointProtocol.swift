//
//  UserEndPointProtocol.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 12.03.2021.
//

import Foundation


protocol UserEndPointProtocol: class {
    func createUser(name: String, surname: String, userName: String, password: String, complition:  @escaping ((User) -> Void))
    }
