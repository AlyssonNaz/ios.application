//
//  ViewController.swift
//  seugarcom
//
//  Created by Alysson Nazareth on 26/11/15.
//  Copyright © 2015 Alysson Nazareth. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import CryptoSwift

class LoginViewController: BaseUIViewController, UITextFieldDelegate, AuthDelegate {
    
    // MARK: Properties
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    // MARK: Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds);
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill;
        backgroundImage.image = UIImage(named: "BackgroundLogin")
        self.view.insertSubview(backgroundImage, at: 0)
        
        if (FBSDKAccessToken.current() == nil)
        {
            print("Not logged in..")
        }
        else
        {
            print("Logged in..")
        }
        
        
//        fbsdkLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
//        
//        fbsdkLoginButton.delegate = self
//        
        
        let username = SettingsManager.getStringUserData("username")
        
        if (username != nil)
        {
            EmailTextField.text = username;
        }
        
        let password = SettingsManager.getStringUserData("password")
        
        if (password != nil)
        {
            PasswordTextField.text = password;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: FBSDK Login Button Actions
    
    @IBAction func FacebookLogin(_ sender: UIButtonEdit) {
        
        let permisions = ["public_profile", "email"]
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.loginBehavior = FBSDKLoginBehavior.native
        
        fbLoginManager.logIn(withReadPermissions: permisions, from: self, handler: { (result, error) -> Void in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                
                if (result! as FBSDKLoginManagerLoginResult).isCancelled == true {
                    
                } else {
                    self.performSegue(withIdentifier: "segueToFirstUse", sender: self)
                }
            }
        })
    }
    
    @IBAction func onLoginClick(_ sender: UIButton) {
        let authApi = Auth()
        authApi.Delegate = self
        authApi.Auth(EmailTextField.text!, password: PasswordTextField.text!)
    }
    
    func OnAuthSuccess(_ user: User!) {
        SettingsManager.setUserData("username", value: EmailTextField.text! as AnyObject)
        SettingsManager.setUserData("password", value: PasswordTextField.text! as AnyObject)
        self.performSegue(withIdentifier: "segueToFirstUse", sender: self)
    }
    
    func OnAuthError(_ error: String!) {
        let alertController = UIAlertController(title: "Ops!", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func OnRegisterSuccess(_ user: User!) {
        
    }
    
    func OnRegisterError(_ error: String!) {
        
    }
    @IBAction func OnRegisterButtonClick(_ sender: UIButtonEdit) {
        self.performSegue(withIdentifier: "segueToRegister", sender: self)
    }
    
    //MARK: UITextField Keyboard Fix
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == EmailTextField)
        {
            PasswordTextField.becomeFirstResponder();
        }
        else {
            textField.resignFirstResponder()
        }
        
        return true;
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == EmailTextField) {
            ScrollView.setContentOffset(CGPoint(x: 0, y: 70), animated: true)
        }
        else if (textField == PasswordTextField){
            ScrollView.setContentOffset(CGPoint(x: 0, y: 90), animated: true)
        }
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        return true;
    }
    
    
    @IBAction func handlePan(_ recognizer:UITapGestureRecognizer) {
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }
}

