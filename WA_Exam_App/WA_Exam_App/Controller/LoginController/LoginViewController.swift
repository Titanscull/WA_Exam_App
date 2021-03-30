//
//  ViewController.swift
//  WA_Exam_App
//
//  Created by Ievgen Petrovskiy on 06.03.2021.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    /// User parse manager
    private let userAPIManager = UserAPIManager.shared
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        userAPIManager.logout()
        
        userAPIManager.retrieveUser()
        
        errorTextLabel.isHidden = true
        
        setKeyboardDelegates()
        
        setTextFieldView()
        
    }
    
    /// Set delegate's for keyboard
    func setKeyboardDelegates() {
        [usernameTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    /// Set textField view
    func setTextFieldView() {
        setFieldCorners(usernameTextField)
        setFieldCorners(passwordTextField)
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
    
    /// Setup activity indicator
    func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
    }
    
    /// Check for input data
    func checkInputData() {
        let enteredUserName = usernameTextField.text!
        let enteredPassword = passwordTextField.text!
        
        if enteredUserName.isEmpty || enteredPassword.isEmpty {
            if enteredPassword.isEmpty && enteredUserName.isEmpty{
                showAlert(text: "First fill all fields")
            } else if enteredUserName.isEmpty {
                errorTextLabel.isHidden = false
                errorTextLabel.text = "Write youre User Name, please"
                setRedBorder(usernameTextField)
                print("User didn't wrote his Username")
            } else if enteredPassword.isEmpty {
                errorTextLabel.isHidden = false
                errorTextLabel.text = "Password for you're User Name is empty"
                setRedBorder(passwordTextField)
                print("User didn't wrote password")
            }
            return
        }
        print("Have data to process with")
    }
    
    /// Login Using parse method
    func logIn(username: String, password: String) {
        setupActivityIndicator()
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainTabBarController = storyboard.instantiateViewController(identifier: "MainView")
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                print("User succesfully loged in")
                print("From now root view controller is TabBarViewController")
            } else {
                print("Failed to process with data - ", error!.localizedDescription)
                self.showAlert(text: error!.localizedDescription)
            }
            self.activityIndicator.stopAnimating()
        }
    }
    
    /// Check for filled textFields & try's Data from model
    @IBAction func loginButton(_ sender: UIButton) {
        
        checkInputData()
        
        logIn(username: usernameTextField.text!, password: passwordTextField.text!)
        
    }
    
    /// Registration Button
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
}


/// Keyboard Delegates
extension LoginViewController: UITextFieldDelegate {
    
    /// Next textField,  if no textFields left hides keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldTag = textField.tag
        
        if let nextTextField = self.view.viewWithTag(textFieldTag+1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    /// Tap on screen to hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /// Hide Error label when typing began & undo highlighting
    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorTextLabel.isHidden = true
        errorTextLabel.text = ""
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    /// Makes rounded corners for textField
    func setFieldCorners(_ textField: UITextField) {
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 15
    }
    
    func setRedBorder(_ textField: UITextField) {
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
}


