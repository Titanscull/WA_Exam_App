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
    
    @IBOutlet weak var errorTextLabel: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    let apiMan = ApiManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiMan.getPopularVideos(completion: nil)
        
        //errorTextLabel.isHidden = true
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
    @IBAction func loginButton(_ sender: Any) {
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: Any) {
    }
}


/// Keyboard Delegates
extension LoginViewController: UITextFieldDelegate {

    /// Hide keyboard when return button pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }

    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// Hide Error label when typing begun
     func textFieldDidBeginEditing(_ textField: UITextField) {
        errorTextLabel.isHidden = true
    }
}



