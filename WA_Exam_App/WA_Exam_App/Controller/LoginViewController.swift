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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setFields()
        
    }
    
    func setFields() {
        self.usernameTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        usernameTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
    }
    
    /// Login Button
    @IBAction func loginButton(_ sender: Any) {
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: Any) {
    }
}





