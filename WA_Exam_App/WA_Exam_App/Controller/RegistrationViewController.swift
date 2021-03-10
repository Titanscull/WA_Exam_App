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
    
    var firstName: String = ""
    var lastName: String = ""
    var userName: String = ""
    var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetUserData()
        regErrorLabel.isHidden = true
        setFieldCorners()
        setRegTextFieldDelegates()
        
    }
    
    /// Clears any input data by previous user
    func resetUserData() {
        firstName = ""
        lastName = ""
        userName = ""
        password = ""
        
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
        } else {
            firstName = firstNameTextField.text!
            print("Users firstname now is \(firstName)")
        }
        
        /// Last name check
        if lastNameTextField.text == "" {
            lastNameTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Last name field is empty"
            print(regErrorLabel.text!)
            return
        } else {
            lastName = lastNameTextField.text!
            print("Users last name now is \(lastName)")
            
        }
        
        /// UserName check
        if usernameTextField.text == "" {
            usernameTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "UserName field is empty"
            print(regErrorLabel.text!)
        } else {
            userName = usernameTextField.text!
            print("Users decide \(userName) to be his Username")
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
            password = passwordTextField.text!
            print("Password added")
        }
        
        /// Is password equals to self  check
        if checkPasswordTextField.text != passwordTextField.text {
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Password missmatch, check again"
            passwordTextField.backgroundColor = .red
            checkPasswordTextField.backgroundColor = .red
            checkPasswordTextField.text = ""
            passwordTextField.text = ""
            print("Password checking missmatch")
            print(regErrorLabel.text!)
            return
        } else {
            /// Will ad soon
        }
        
        /// Full Check
        if !firstName.isEmpty && !lastName.isEmpty && !userName.isEmpty && !password.isEmpty && passwordTextField.text == checkPasswordTextField.text {
            
        }
        
        
        // Добавить проверки
        
//        let loginStruct = LoginStruct(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", userName: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
           
        
    }
    
}

/// Keyboard Delegates
extension RegistrationViewController: UITextFieldDelegate {
    
    /// Hide keyboard when return button pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        checkPasswordTextField.resignFirstResponder()
        return true
    }
    
    /// Hide Error label when typing begun
    func textFieldDidBeginEditing(_ textField: UITextField) {
        regErrorLabel.isHidden = true
        usernameTextField.backgroundColor = .white
        firstNameTextField.backgroundColor = .white
        lastNameTextField.backgroundColor = .white
        passwordTextField.backgroundColor = .white
        checkPasswordTextField.backgroundColor = .white
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

