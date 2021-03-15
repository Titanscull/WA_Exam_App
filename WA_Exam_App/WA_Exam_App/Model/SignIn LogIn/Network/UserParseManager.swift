//
//  UserParseManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 13.03.2021.
//

import Foundation
import Parse

class UserParseManager: UserEndPointProtocol {
    func createUser(name: String, surname: String, userName: String, password: String) {
        let parseObject = PFObject(className:"User")

        parseObject["name"] = name
        parseObject["surname"] = surname
        parseObject["userName"] = userName
        parseObject["password"] = password
        
        // Saves the new object.
        parseObject.saveInBackground {
          (success: Bool, error: Error?) in
          if (success) {
            print("The object has been saved.")
          } else {
            print("UserParseManager failed to save object")
          }
        }
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
