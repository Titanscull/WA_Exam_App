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
    @IBOutlet weak var userNameTextField: UITextField!
    
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
        self.userNameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        self.checkPasswordTextField.layer.masksToBounds = true
        
        firstNameTextField.layer.cornerRadius = 15
        lastNameTextField.layer.cornerRadius = 15
        userNameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        checkPasswordTextField.layer.cornerRadius = 15
    }
    
    /// Set delegate to hide keyboard
    func setRegTextFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    /// Saves correct data to model
    @IBAction func saveDataButton(_ sender: UIButton) {
        
        let name = firstNameTextField.text!
        let surName = lastNameTextField.text!
        let userName = userNameTextField.text!
        let password = passwordTextField.text!
        let checkedPassword = checkPasswordTextField.text!
        
        /// Checking for input of Users data
        if name.isEmpty || surName.isEmpty ||  password.isEmpty || checkedPassword.isEmpty {
            if name.isEmpty {
                firstNameTextField.backgroundColor = .red
                print("Name field is empty")
            }
            if surName.isEmpty {
                lastNameTextField.backgroundColor = .red
                print("Surname field is empty")
            }
            if userName.isEmpty {
                userNameTextField.backgroundColor = .red
                print("Username field is empty")
            }
            if password.isEmpty {
                passwordTextField.backgroundColor = .red
                print("Password is empty")
            }
            if checkedPassword.isEmpty {
                checkPasswordTextField.backgroundColor = .red
                print("Check password is empty")
            }
            regErrorLabel.isHidden = false
            regErrorLabel.text = "All fields required"
            return
        }
        
        if password != checkedPassword {
            passwordTextField.backgroundColor = .red
            checkPasswordTextField.backgroundColor = .red
            regErrorLabel.isHidden = false
            regErrorLabel.text = "Passwords missmatch"
            return
        }
        
        if !name.isEmpty && !surName.isEmpty && !password.isEmpty && !checkedPassword.isEmpty && password == checkedPassword {
        }
        //
        //        /// Firstname check
        //        if firstNameTextField.text == "" {
        //            firstNameTextField.backgroundColor = .red
        //            regErrorLabel.isHidden = false
        //            regErrorLabel.text = "First name field is empty"
        //            print(regErrorLabel.text!)
        //            return
        //        }
        //
        //        /// Last name check
        //        if lastNameTextField.text == "" {
        //            lastNameTextField.backgroundColor = .red
        //            regErrorLabel.isHidden = false
        //            regErrorLabel.text = "Last name field is empty"
        //            print(regErrorLabel.text!)
        //            return
        //        }
        //
        //        /// UserName check
        //        if userNameTextField.text == "" {
        //            userNameTextField.backgroundColor = .red
        //            regErrorLabel.isHidden = false
        //            regErrorLabel.text = "User Name field is empty"
        //            print(regErrorLabel.text!)
        //        }
        //
        //        /// Password check
        //        // MARK: Will add password validation also
        //        if passwordTextField.text == "" {
        //            passwordTextField.backgroundColor = .red
        //            regErrorLabel.isHidden = false
        //            regErrorLabel.text = "Missing password"
        //            print(regErrorLabel.text!)
        //            return
        //        } else {
        //            // Mark: Add validation here??
        //        }
        //
        //        /// Is password equals to self  check
        //        if checkPasswordTextField.text != passwordTextField.text {
        //            regErrorLabel.isHidden = false
        //            regErrorLabel.text = "Password missmatched, check again"
        //            passwordTextField.backgroundColor = .red
        //            checkPasswordTextField.backgroundColor = .red
        //            checkPasswordTextField.text = ""
        //            passwordTextField.text = ""
        //            print("Password checking found missmatch")
        //            print(regErrorLabel.text!)
        //            return
        //        }
        //
        //        /// Full Check
        //        if regErrorLabel.text == "" {
        //
        //            let name = firstNameTextField.text!
        //            print("Users firstname now is \(name)")
        //
        //            let surName = lastNameTextField.text!
        //            print("Users last name now is \(surName)")
        //
        //            let userName = userNameTextField.text!
        //            print("Users decide \(userName) to be his Username")
        //
        //            let password = passwordTextField.text!
        //            print("Password added")
        //
        //            let loginStruct = LoginStruct(firstName: name , lastName: surName , userName: userName , password: password)
        //
        //        }
    }
    
    
    
}

/// Keyboard Delegates
extension RegistrationViewController: UITextFieldDelegate {
    
    /// Next textField if next button pressed or hides keyboard if no fields left
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

