//
//  ViewController.swift
//  Chatter
//
//  Created by Harjas Monga on 1/31/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func screenTapped(_ sender: Any) {
        view.endEditing(true)
    }
    func registerUser() {
        let newUser = PFUser()
        
        newUser.username = usernameLabel.text
        newUser.password = passwordLabel.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                let message: String
                if error.localizedDescription == "Account already exists for this username." {
                    message = "Username already taken"
                } else {
                    message = "Failure to "
                }
                 let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                self.loginUser()
            }
        }
    }
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                let alertController = UIAlertController(title: "Error", message: "Username and password are invalid", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    func checkFields() -> Bool {
        if usernameLabel.text!.isEmpty || passwordLabel.text!.isEmpty {
            let alertController = UIAlertController(title: "Missing username or password", message: "Please enter your username and password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return false
        }
        return true
    }
    @IBAction func signIn(_ sender: Any) {
        if checkFields() {
            loginUser()
        }
    }
    @IBAction func signUp(_ sender: Any) {
        if checkFields() {
            registerUser()
        }
    }
    
}

