//
//  AppCoordinator.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 23.03.2021.
//

import Foundation
import Parse

class AppCoordinator {
    
    var window: UIWindow?
    
    func showMainScreen(window: UIWindow) {
        
        if (PFUser.current() != nil) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainView")
            window.rootViewController = mainTabBarController
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginView")
            window.rootViewController = loginNavController
        }
        window.makeKeyAndVisible()
    }
    
}
