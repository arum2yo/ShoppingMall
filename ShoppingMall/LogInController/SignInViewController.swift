//
//  SignInViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/10/05.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailSigninText: UITextField! = {
        
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
        return textField
    }()
    @IBOutlet weak var passwordSigninText: UITextField! = {
        
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
        return textField
    }()
    @IBOutlet weak var rePasswordSigninText: UITextField! = {
        
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.appColor(.textFieldLine).cgColor
        
        return textField
    }()
    
    @IBOutlet weak var agreeAllButton: UIButton!
    @IBOutlet weak var agreeNeedButton: UIButton!
    @IBOutlet weak var agreeBuyButton: UIButton!
    @IBOutlet weak var agreePersonalButton: UIButton!
    @IBOutlet weak var signLineView: UIView!
    @IBOutlet weak var agreeSelectButton: UIButton!
    @IBOutlet weak var agreeSellButton: UIButton!
    @IBOutlet weak var agreeEmailBUtton: UIButton!
    @IBOutlet weak var agreeMsgButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton! = {
        
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.appColor(.defaultGrayColor).cgColor
        
    return button
}()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func signOutButtonTab(_ sender: Any) {
        
        AuthNetworking.registerNetworking(username: "Arum", email: self.emailSigninText.text!, password: self.passwordSigninText.text!, completion: { (message) in

            
            let alertVC = UIAlertController(title: "회원가입되었습니다.", message: message, preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "로그인하러가기", style: .default) { (_) in
                if let navi = self.navigationController {
                    navi.popViewController(animated: true)
                }
            }
            
            
            alertVC.addAction(alertAct)
            
            self.present(alertVC, animated: true, completion: nil)
            
        })
    }
            
    
    
    @IBAction func backButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
}
