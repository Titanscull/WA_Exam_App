//
//  RegistrationViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit
import Parse

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var underImageView: UIView!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    private let userAPIManager = UserAPIManager.shared
    private let regexCondition =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
    private let regexText = "Password should contain at least one number, one upper cased letter and to be 6 or more characters in lenght"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFieldCorners()
        setImageCorners()
        setRegTextFieldDelegates()
        
    }
    
    /// Make Rounder underImageView && UIImageView
    func setImageCorners() {
        self.underImageView.layer.masksToBounds = true
        underImageView.layer.cornerRadius = 80
        self.userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 70
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
    
    /// Alert for errors in input
    func showAlert(textAlert: String) {
        let alert  = UIAlertController(title: "Important!", message: textAlert, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    /// Regex implementation
    func regexTest(password : String) -> Bool {
        let validation = NSPredicate(format: "SELF MATCHES %@", regexCondition)
        return validation.evaluate(with: password)
    }
    
    /// Check if password is valid & allow to register a user
    func validatePasswordAndRegister() {
        let isValid = regexTest(password: passwordTextField.text!)
        
        if (isValid == false) {
            showAlert(textAlert: regexText )
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            print("Password didnt passed Validation")
            
            return
        } else {
            userAPIManager.createUser(name: firstNameTextField.text!, surname: lastNameTextField.text!, username: userNameTextField.text!, password: passwordTextField.text!) { _ in
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            print("Password valid - user is safe")
        }
    }
    
    
    /// Saves correct data to model
    @IBAction func saveDataButton(_ sender: UIButton) {
        
        guard let enteredName = firstNameTextField.text,
              let enteredSurname = lastNameTextField.text,
              let enteredUserName = userNameTextField.text,
              let enteredPassword = passwordTextField.text,
              let checkedEnteredPassword = checkPasswordTextField.text else { return }
        
        /// Checking for input of Users data
        if enteredName.isEmpty || enteredSurname.isEmpty || enteredPassword.isEmpty || checkedEnteredPassword.isEmpty {
            if enteredName.isEmpty {
                firstNameTextField.layer.borderWidth = 2
                firstNameTextField.layer.borderColor = UIColor.red.cgColor
                print("Name field is empty")
            }
            if enteredSurname.isEmpty {
                lastNameTextField.layer.borderWidth = 2
                lastNameTextField.layer.borderColor = UIColor.red.cgColor
                print("Surname field is empty")
            }
            if enteredUserName.isEmpty {
                userNameTextField.layer.borderWidth = 2
                userNameTextField.layer.borderColor = UIColor.red.cgColor
                print("Username field is empty")
            }
            if enteredPassword.isEmpty {
                passwordTextField.layer.borderWidth = 2
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                print("Password is empty")
            }
            if checkedEnteredPassword.isEmpty {
                checkPasswordTextField.layer.borderWidth = 2
                checkPasswordTextField.layer.borderColor = UIColor.red.cgColor
                print("Check password is empty")
            }
            showAlert(textAlert: "Marked fields should be filled")
            return
        }
        
        if enteredPassword != checkedEnteredPassword {
            passwordTextField.layer.borderWidth = 2
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            checkPasswordTextField.layer.borderWidth = 2
            checkPasswordTextField.layer.borderColor = UIColor.red.cgColor
            showAlert(textAlert: "Password is not the same")
            return
        }
        
        validatePasswordAndRegister()
        
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
        textField.backgroundColor = .white
        textField.layer.borderWidth = 0
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

