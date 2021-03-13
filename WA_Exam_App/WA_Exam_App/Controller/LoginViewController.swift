//
//  ViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorTextLabel: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    let apiMan = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
      apiMan.getPopularVideos(completion: nil)

      errorTextLabel.isHidden = true
      
        setFieldCorners()
        setKeyboardDelegates()
        
    }
    
    /// Set delegate to hide keyboard
    func setKeyboardDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /// Makes rounded corners for textField
    func setFieldCorners() {
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
    }
    
    /// Try's Data from model?
    @IBAction func loginButton(_ sender: UIButton) {
        
        let enteredUserName = usernameTextField.text!
        let enteredPassword = passwordTextField.text!
        
        if enteredUserName.isEmpty || enteredPassword.isEmpty {
            
            errorTextLabel.isHidden = false
            errorTextLabel.text = "All fields required"
            
            if enteredUserName.isEmpty {
                usernameTextField.backgroundColor = .red
                print("User didn't wrote his Username")
            }
            if enteredPassword.isEmpty {
                passwordTextField.backgroundColor = .red
                print("User didn't wrote password")
            }
            
            return
            
        }
        
        if !enteredUserName.isEmpty && !enteredPassword.isEmpty {
            // MARK: Add comparative Logic Here
        }
        
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: UIButton) {
    }
}


/// Keyboard Delegates
extension LoginViewController: UITextFieldDelegate {

    /// Next textField or hide keyboard if no textFields left
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldTag: Int = textField.tag
        
        if let nextTextField = self.view.viewWithTag(textFieldTag+1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }

    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// Hide Error label when typing began
     func textFieldDidBeginEditing(_ textField: UITextField) {
        errorTextLabel.isHidden = true
        errorTextLabel.text = ""
        textField.backgroundColor = .white
    }
}



