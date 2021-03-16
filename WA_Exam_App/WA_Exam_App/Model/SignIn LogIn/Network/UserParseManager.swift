//
//  UserParseManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 13.03.2021.
//

import Foundation
import Parse

class UserParseManager: UserEndPointProtocol {
    
    func signIn(username: String, password: String) {
        PFUser.logInWithUsername(inBackground: username , password: password) { user, error in
            if user != nil {
                print("Balls eye, user data is correct")
            } else {
                print("Failed to process with data - ", error!.localizedDescription)
            }
        }
    }
    
    func createUser(name: String, surname: String, username: String, password: String, completion: @escaping ((User) -> Void)) {
        let parseObject = PFUser()
        
        parseObject["name"] = name
        parseObject["surname"] = surname
        parseObject["username"] = username
        parseObject["password"] = password
        
        parseObject.signUpInBackground() {
            (success: Bool, error: Error?) in
            if success, let user = User(parseObject: parseObject) {
                completion(user)
                print("New user have been saved")
            } else {
                print("Can not save user")
            }
        }
    }
    
    func readUser(completion: @escaping (([User]) -> Void)) {
//        // MARK: Is not working properly yet
//        let query = PFUser.query()
//        query!.findObjectsInBackground(block: { parseObjects, error in
//            if let error = error {
//                print("Eroor", error.localizedDescription)
//                return
//            }
//            guard let parseObjects = parseObjects else {
//                print("User data read is empty")
//                return
//            }
//            let resultArray = parseObjects.compactMap(User.init)
//            completion(resultArray)
//            print(resultArray)
//        })
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
