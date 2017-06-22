//
//  ViewController.swift
//  ReactiveLogin
//
//  Created by Nicolas Suarez-Canton Trueba on 6/22/17.
//  Copyright © 2017 Nicolas Suarez-Canton Trueba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.backgroundColor = UIColor.white
        textField.autocapitalizationType = .none
        
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        // Add padding to the email field.
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = UITextFieldViewMode.always
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.backgroundColor = UIColor.white
        
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        // Add padding to the password field.
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = UITextFieldViewMode.always
        
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Login", for: UIControlState.normal)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(passwordTextField)
        setPasswordTextField()
        
        view.addSubview(emailTextField)
        setEmaiTextField()
        
        view.addSubview(loginButton)
        setLoginButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPasswordTextField() {
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func setEmaiTextField() {
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -12).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
    }
    
    func setLoginButton() {
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 18).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
    }


}

