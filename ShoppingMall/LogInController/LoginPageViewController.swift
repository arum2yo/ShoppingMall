//
//  LoginPageViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import FBSDKLoginKit

import GoogleSignIn

class LoginPageViewController: UIViewController {
   
    @IBOutlet weak var emailTextField: UITextField! = {
        
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
        return textField
    }()
    
    @IBOutlet weak var passwordTextField: UITextField! = {
       
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
        
        return textField
    }()
  
    @IBOutlet weak var AutoLogInButton: UIButton!
    @IBOutlet weak var autoLoginLable: UILabel!
    
    @IBOutlet weak var saveIdButton: UIButton!
    @IBOutlet weak var saveIdLabel: UILabel!
    
    @IBOutlet weak var signinButton: UIButton! = {
    
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
    return button
}()
    @IBOutlet weak var simpleLoginLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
    }
    
    
    @IBAction func searchIdPwdButtonTab(_ sender: Any) {
        
    }
    
    
    @IBAction func loginButtonTab(_ sender: Any) {
        
        AuthNetworking.logInNetworking(identifier: self.emailTextField.text!, password: self.passwordTextField.text!) { (message) in
            let alertVC = UIAlertController(title: "로그인 실패.", message: message, preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "다시 로그인하기 ", style: .default) { (_) in
                if let navi = self.navigationController {
                    navi.popViewController(animated: true)
                }
            }
            
            
            alertVC.addAction(alertAct)
            
            self.present(alertVC, animated: true, completion: nil)
           
        } completion: {
            
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = mainStoryBoard.instantiateViewController(identifier: "Main")
            UIApplication.shared.keyWindow?.rootViewController = mainVC
        }

        
}
        
        
        
        
    
    @IBAction func signinButtonTab(_ sender: Any) {
        
    }
    
    
    @IBAction func loginNaverTab(_ sender: Any) {
    }
    
    @IBAction func loginKakaoTab(_ sender: Any) {
    }
    
    @IBAction func loginFacebookTab(_ sender: Any) {
        

    }
    
    @IBAction func loginGoogleTab(_ sender: Any) {
        
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()

        
    }
    
    @IBAction func loginAppleTab(_ sender: Any) {
        
    }
    

}



extension LoginPageViewController: GIDSignInDelegate{
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            print(error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }
        
        let idToken = authentication.idToken
        
//        AuthNetwok.googleLoginNetwork(idToken: idToken!, view: self) {
//           
//            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//            
//            let mainVC = mainStoryBoard.instantiateViewController(identifier: "MainHome1")
//            UIApplication.shared.keyWindow?.rootViewController = mainVC
//            
//        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }
}
