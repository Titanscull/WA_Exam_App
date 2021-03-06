//
//  RegistrationViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var underImageView: UIView!
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFieldCorners()
        setImageCorners()
        setRegTextFieldDelegates()
        
    }
    
    /// Make Rounder underImageView && UIImageView
    func setImageCorners() {
        self.underImageView.layer.masksToBounds = true
        underImageView.layer.cornerRadius = 50
        self.userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 40
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
    
    
    /// Saves correct data to model
    @IBAction func saveDataButton(_ sender: UIButton) {
        
        let enteredName = firstNameTextField.text ?? ""
        let enteredSurname = lastNameTextField.text ?? ""
        let enteredUserName = userNameTextField.text ?? ""
        let enteredPassword = passwordTextField.text ?? ""
        let checkedEnteredPassword = checkPasswordTextField.text ?? ""
        
        /// Checking for input of Users data
        if enteredName.isEmpty || enteredSurname.isEmpty ||  enteredPassword.isEmpty || checkedEnteredPassword.isEmpty {
            if enteredName.isEmpty {
                firstNameTextField.backgroundColor = .red
                print("Name field is empty")
            }
            if enteredSurname.isEmpty {
                lastNameTextField.backgroundColor = .red
                print("Surname field is empty")
            }
            if enteredUserName.isEmpty {
                userNameTextField.backgroundColor = .red
                print("Username field is empty")
            }
            if enteredPassword.isEmpty {
                passwordTextField.backgroundColor = .red
                print("Password is empty")
            }
            if checkedEnteredPassword.isEmpty {
                checkPasswordTextField.backgroundColor = .red
                print("Check password is empty")
            }
            showAlert(textAlert: "Marked fields should be filled")
            return
        }
        
        if enteredPassword != checkedEnteredPassword {
            passwordTextField.backgroundColor = .red
            checkPasswordTextField.backgroundColor = .red
            showAlert(textAlert: "Password is not the same")
            return
        }
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
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

