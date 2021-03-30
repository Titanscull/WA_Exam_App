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
    
    //    private lazy var keyboardPresenter = KeyboardNotificationClass(view: RegistrationViewController)
    
    private let regexCondition =  ("(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
    private let regexText = "Password should contain at least one number, one upper cased letter and to be 6 or more characters in lenght"
    
    override func viewWillAppear(_ animated: Bool) {
        moveSceneUp()
        //        keyboardPresenter.moveSceneUp()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        moveSceneDown()
        //        keyboardPresenter.moveSceneDown()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFieldCorners()
        setImageCorners()
        setTextFieldDelegates()
        
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
        [firstNameTextField, lastNameTextField, userNameTextField, passwordTextField, checkPasswordTextField].forEach {
            $0?.layer.masksToBounds = true
            $0?.layer.cornerRadius = 15
            $0?.layer.borderWidth = 0.5
            $0?.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    /// Set delegate to hide keyboard
    func setTextFieldDelegates() {
        [firstNameTextField, lastNameTextField, userNameTextField, passwordTextField, checkPasswordTextField].forEach {
            $0?.delegate = self
        }
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
    
    /// Regex implementation
    func regexTest(password : String) -> Bool {
        let validation = NSPredicate(format: "SELF MATCHES %@", regexCondition)
        return validation.evaluate(with: password)
    }
    
    /// Check if password is valid & allow to register a user
    func validatePassword() {
        let isValid = regexTest(password: passwordTextField.text!)
        
        if (isValid == false) {
            showAlert(text: regexText)
            setRedBorder(passwordTextField)
            print("Password didnt passed Validation")
            return
        } else {
            createUser()
        }
    }
    
    /// Check users input data
    func userValidation() {
        guard let enteredName = firstNameTextField.text,
              let enteredSurname = lastNameTextField.text,
              let enteredUserName = userNameTextField.text,
              let enteredPassword = passwordTextField.text,
              let checkedEnteredPassword = checkPasswordTextField.text else { return }
        
        /// Checking for input of Users data
        if enteredName.isEmpty || enteredSurname.isEmpty || enteredPassword.isEmpty || checkedEnteredPassword.isEmpty {
            if enteredName.isEmpty {
                setRedBorder(firstNameTextField)
                print("Name field is empty")
            }
            if enteredSurname.isEmpty {
                setRedBorder(lastNameTextField)
                print("Surname field is empty")
            }
            if enteredUserName.isEmpty {
                setRedBorder(userNameTextField)
                print("Username field is empty")
            }
            if enteredPassword.isEmpty {
                setRedBorder(passwordTextField)
                passwordTextField.layer.borderColor = UIColor.red.cgColor
                print("Password is empty")
            }
            if checkedEnteredPassword.isEmpty {
                setRedBorder(checkPasswordTextField)
                print("Check password is empty")
            }
            showAlert(text: "Marked fields should be filled")
            return
        }
        
        if passwordTextField.text == checkPasswordTextField.text {
            validatePassword()
            return
        }
        
    }
    
    /// Create user
    func createUser() {
        userAPIManager.createUser(name: firstNameTextField.text!, surname: lastNameTextField.text!, username: userNameTextField.text!, password: passwordTextField.text!) { _ in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
                self.userAPIManager.logout()
            }
        }
        print("Password valid - user is safe")
    }
    
    /// Saves correct UserData
    @IBAction func saveDataButton(_ sender: UIButton) {
        
        userValidation()
        
    }
    
}

/// Keyboard Delegates
extension RegistrationViewController: UITextFieldDelegate {
    
    /// Next textField if next button pressed or hides keyboard if no fields left
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldTag = textField.tag
        
        if let nextTextField = self.view.viewWithTag(textFieldTag+1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    /// Hide Error label when typing begun
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setRedBorder(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
}

extension RegistrationViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        if self.view.bounds.origin.y == 0{
            self.view.bounds.origin.y += keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.bounds.origin.y != 0 {
            self.view.bounds.origin.y = 0
        }
    }
    
    func moveSceneUp() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func moveSceneDown() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    
}
