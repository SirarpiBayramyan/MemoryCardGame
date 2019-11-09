//
//  LoginViewController.swift
//  Concentration
//
//  Created by Sirarpi on 11/7/19.
//  Copyright © 2019 Sirarpi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    @IBAction func handleLogin(_ sender: UIButton) {
        
        
        if loginField.text == User.sharedUser.email && passwordField.text == User.sharedUser.password {
          
        }else{
            let ac = UIAlertController(title: "Authentication failed", message: "Sorry!", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(ac, animated: true)
        }
        loginField.text = ""
        passwordField.text = ""
    }
    @objc func keyboardWillChange(notification: Notification) {
        guard  let keyboardRact = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification {
            view.frame.origin.y = -keyboardRact.height
        }else if notification.name == UIResponder.keyboardWillHideNotification{
            view.frame.origin.y = 0
        }
        
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.delegate = self
        loginField.delegate = self
        
        
        
        //listen for keyBoard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
    }
    deinit {
        
        //stop listening for keyboard
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
   
    

}
