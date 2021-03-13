//
//  UserParseManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 13.03.2021.
//

import Foundation
import Parse

class UserParseManager: UserEndPointProtocol {
    func createUser(name: String, surname: String, userName: String) {
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
        let query = PFQuery(className:"User")

        query.findObjectsInBackground { object, error in
            if let error = error {
                print("Eroor", error.localizedDescription)
                return
            }
            guard let object = object else {
                print("User data read is empty")
                return
            }
            print(object.first?["Name"])
        }
    }
    
    func deleteUser(user: User) {

    }
    
    func updateUser(user: User) {
   
    }
    
    
}
