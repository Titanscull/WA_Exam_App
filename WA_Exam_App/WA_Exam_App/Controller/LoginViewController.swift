//
//  ViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setFieldCorners()
        setKeyboardDelegates()
        
    }
    
    func setKeyboardDelegates() {
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setFieldCorners() {
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
    }
    
    /// Login Button
    @IBAction func loginButton(_ sender: Any) {
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: Any) {
    }
}


/// Keyboard Delegates
extension LoginViewController: UITextFieldDelegate {

    /// Use return button to hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }

    /// Use tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}



