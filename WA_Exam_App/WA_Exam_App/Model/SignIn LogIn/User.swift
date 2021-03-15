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
    let userName: String
    let password: String
    let objectId: String
    
    init?(parseObject: PFObject) {
        guard let name = parseObject["name"] as? String,
              let surName = parseObject["surname"] as? String,
              let userName = parseObject["userName"] as? String,
              let password = parseObject["password"] as? String,
              let objectId = parseObject.objectId else {
            return nil
        }
        self.name = name
        self.surname = surName
        self.userName = userName
        self.password = password
        self.objectId = objectId
    }
}
