//
//  UserParseManager.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 13.03.2021.
//

import Foundation
import Parse

class UserParseManager: UserEndPointProtocol {
    
    
    func logout() {
        PFUser.logOutInBackground { (error: Error?) in
            if (error == nil){
                print("Succesfully loged out")
            }else{
                if let error = error?.localizedDescription{
                    print(error)
                }
            }
        }
    }
    
    func retrieveUser() {
        let currentUser = PFUser.current()
        if currentUser != nil {
            print("\(String(describing: currentUser))")
        } else {
            print("No user")
        }
    }
    
    
    func signIn(username: String, password: String) {
        PFUser.logInWithUsername(inBackground: username , password: password) { user, error in
            if user != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainView")
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
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
        
    }
    
    func deleteUser(user: User) {
        
    }
    
    func updateUser(user: User) {
        
    }
    
    
}
