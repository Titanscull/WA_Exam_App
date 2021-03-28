////
////  KeyboardNotificationClass.swift
////  WA_Exam_App
////
////  Created by Ievgen Petrovskiy on 28.03.2021.
////
//
//import UIKit
//
//protocol KeyboardNotificationClassDelegate: class {
//    func moveSceneUp()
//    func moveSceneDown()
//}
//
//
//class KeyboardNotificationClass {
//
//    weak var view: RegistrationViewController?
//    
//    init(view: RegistrationViewController) {
//        self.view = view
//    }
//    
//    func moveSceneUp() {
//        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//        
//    }
//    
//    func moveSceneDown() {
//        
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//        
//    }
//    
//    @objc func keyboardWillShowUP(notification: NSNotification) {
//                guard let userInfo = notification.userInfo else {return}
//                guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
//                let keyboardFrame = keyboardSize.cgRectValue
//
//        if self.view.bounds.origin.y == 0{
//                    self.view.bounds.origin.y += keyboardFrame.height
//                }
//            }
//    
//    @objc func keyboardWillHideOff(notification: NSNotification) {
//                if self.view.bounds.origin.y != 0 {
//                    self.view.bounds.origin.y = 0
//                }
//            }
//    
//}
