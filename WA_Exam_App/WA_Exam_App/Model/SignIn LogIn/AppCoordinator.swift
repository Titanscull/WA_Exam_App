//
//  AppCoordinator.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 23.03.2021.
//

import Foundation
import Parse

class AppCoordinator {
     
    func showMainScreen(window: UIWindow) {
        
        if (PFUser.current() != nil) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainView")
                window.rootViewController = vc
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginView")
                window.rootViewController = vc
            }
            window.makeKeyAndVisible()
        }

    
}
