//
//  RegistrationViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var regErrorLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        regErrorLabel.isHidden = true
        setFieldCorners()
        setRegTextFieldDelegates()
        
    }
    
    /// Makes rounded corners for textField
    func setFieldCorners() {
        self.firstNameTextField.layer.masksToBounds = true
        self.lastNameTextField.layer.masksToBounds = true
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        self.checkPasswordTextField.layer.masksToBounds = true
        
        firstNameTextField.layer.cornerRadius = 15
        lastNameTextField.layer.cornerRadius = 15
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        checkPasswordTextField.layer.cornerRadius = 15
    }
    
    /// Set delegate to hide keyboard
    func setRegTextFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    /// Saves correct data to model
    @IBAction func saveDataButton(_ sender: UIButton) {
        
        /// Firstname check
        if firstNameTextField.text == "" {
            firstNameTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "First name field is empty"
            print(regErrorLabel.text!)
            return
        }
        
        /// Last name check
        if lastNameTextField.text == "" {
            lastNameTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Last name field is empty"
            print(regErrorLabel.text!)
            return
        }
        
        /// UserName check
        if usernameTextField.text == "" {
            usernameTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "UserName field is empty"
            print(regErrorLabel.text!)
        }
        
        /// Password check
        // MARK: Will add password validation also
        if passwordTextField.text == "" {
            passwordTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Missing password"
            print(regErrorLabel.text!)
            return
        } else {
            // Mark: Add validation here??
        }
        
        /// Is password equals to self  check
        if checkPasswordTextField.text != passwordTextField.text {
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Password missmatched, check again"
            passwordTextField.backgroundColor = .red
            checkPasswordTextField.backgroundColor = .red
            checkPasswordTextField.text = ""
            passwordTextField.text = ""
            print("Password checking found missmatch")
            print(regErrorLabel.text!)
            return
        }
        
        /// Full Check
        if regErrorLabel.text == "" {
            
            let name = firstNameTextField.text!
            print("Users firstname now is \(name)")
            
            let surname = lastNameTextField.text!
            print("Users last name now is \(surname)")
            
            let userName = usernameTextField.text!
            print("Users decide \(userName) to be his Username")
            
            let password = passwordTextField.text!
            print("Password added")
            
            //            let loginStruct = LoginStruct(firstName: name , lastName: surname , userName: userName , password: password)
            
        }
    }
    
    
    
}

/// Keyboard Delegates
extension RegistrationViewController: UITextFieldDelegate {
    
    /// Next field after next button pressed or disapear if no fields left
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldTag: Int = textField.tag
        
        if let nextTextField = self.view.viewWithTag(textFieldTag+1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    /// Hide Error label when typing begun
    func textFieldDidBeginEditing(_ textField: UITextField) {
        regErrorLabel.isHidden = true
        regErrorLabel.text = ""
        textField.backgroundColor = .white
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

