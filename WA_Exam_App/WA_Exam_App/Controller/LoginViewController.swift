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
    
    /// User parse
    private let userAPIManager = UserAPIManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAPIManager.retrieveUser()
        
        errorTextLabel.isHidden = true
        
        setFieldCorners()
        setKeyboardDelegates()
        
    }
    
    /// Set delegate to hide keyboard
    func setKeyboardDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    /// Alert for errors in input
    func showAlert(text: String) {
        let alert  = UIAlertController(title: "Important!", message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    /// Makes rounded corners for textField
    func setFieldCorners() {
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
    }
    
    /// Check for filled textFields & try's Data from model
    @IBAction func loginButton(_ sender: UIButton) {
        
        let enteredUserName = usernameTextField.text!
        let enteredPassword = passwordTextField.text!
        
        if enteredUserName.isEmpty || enteredPassword.isEmpty {
            if enteredPassword.isEmpty && enteredUserName.isEmpty{
                showAlert(text: "First fill all fields")
            } else if enteredUserName.isEmpty {
                errorTextLabel.isHidden = false
                errorTextLabel.text = "Write youre User Name, please"
                usernameTextField.layer.borderWidth = 2
                usernameTextField.layer.borderColor = UIColor.red.cgColor
                print("User didn't wrote his Username")
            } else if enteredPassword.isEmpty {
                errorTextLabel.isHidden = false
                errorTextLabel.text = "Password for you're User Name is empty"
                passwordTextField.layer.borderWidth = 2
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                print("User didn't wrote password")
            }
            return
        }
        
        print("Have data to process with")
        
        userAPIManager.signIn(username: enteredUserName, password: enteredPassword)
        
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
}


/// Keyboard Delegates
extension LoginViewController: UITextFieldDelegate {
    
    /// Next textField,  if no textFields left hides keyboard
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
    
    /// Hide Error label when typing began & undo highlighting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorTextLabel.isHidden = true
        errorTextLabel.text = ""
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.white.cgColor
    }
}



