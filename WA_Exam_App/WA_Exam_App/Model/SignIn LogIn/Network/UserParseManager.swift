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

        query.findObjectsInBackground { objects, error in
            if let error = error {
                print("Eroor", error.localizedDescription)
                return
            }
            guard let objects = objects else {
                print("User data read is empty")
                return
            }
            let resultArray = objects.compactMap(User.init)
            completion(resultArray)
        }
    }
    
    func deleteUser(user: User) {

    }
    
    func updateUser(user: User) {
   
    }
    
    
}
