//
//  UserStruct.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 12.03.2021.
//

import Foundation
import Parse

struct User: Codable {
    let name: String
    let surname: String
    let username: String
    let password: String
    let objectId: String
    
    init?(parseObject: PFObject) {
        guard let name = parseObject["name"] as? String,
              let surname = parseObject["surname"] as? String,
              let username = parseObject["username"] as? String,
              let password = parseObject["password"] as? String,
              let objectId = parseObject.objectId else {
            return nil
        }
        self.name = name
        self.surname = surname
        self.username = username
        self.password = password
        self.objectId = objectId
    }
}
