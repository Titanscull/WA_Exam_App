//
//  UserStruct.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 12.03.2021.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let userName: String
    let password: String
    let objectId: String
    
//    init(name: String, surname: String, userName: String, password: String) {
//        self.name = name
//        self.surname = surname
//        self.userName = userName
//        self.password = password
//    }
}
