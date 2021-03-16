//
//  UserParseManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 13.03.2021.
//

import Foundation
import Parse

class UserParseManager: UserEndPointProtocol {
    
    func signIn(userName: String, password: String) {
        PFUser.logInWithUsername(inBackground: userName , password: password) { user, error in
            if user != nil {
                print("Balls eye, user data is corrct")
            } else {
                print("fail to process with data", error!.localizedDescription)
            }
        }
    }
    
    func createUser(name: String, surname: String, userName: String, password: String, completion: @escaping ((User) -> Void)) {
        let parseObject = PFObject(className:"User")
        
        parseObject["name"] = name
        parseObject["surname"] = surname
        parseObject["userName"] = userName
        parseObject["password"] = password
        
//        // Saves the new object.
//        parseObject.saveInBackground {
//            (success: Bool, error: Error?) in
//            if (success) {
//                print("New user have been saved")
//            } else {
//                print("Can not save user")
//            }
//        }
        
        parseObject.saveInBackground {
            (success: Bool, error: Error?) in
            if success, let user = User(parseObject: parseObject) {
                completion(user)
                print("New user have been saved")
            } else {
                print("Error saving car")
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
