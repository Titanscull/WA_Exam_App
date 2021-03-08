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
        //regErrorLabel.isHidden = true
        setFieldCOrners()
        setRegTextFieldDelegates()
        
    }
    
    
    
    /// Makes rounded corners
    func setFieldCOrners() {
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
    
    /// Setting delegates for text fields
    func setRegTextFieldDelegates() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    /// Saves correct data to model
    @IBAction func saveDataButton(_ sender: UIButton) {
    }
    
}

/// Text fields operating delegates
extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        checkPasswordTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        regErrorLabel.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

