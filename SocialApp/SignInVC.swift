//
//  SignInVC.swift
//  SocialApp
//
//  Created by Billy Morris on 1/3/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("BILLY: Not able to authenticate with FB - \(error)")
            } else if result?.isCancelled == true {
                print("BILLY: User cancelled FB authentication")
            } else {
                print("BILLY: Successfully authenticated with FB")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("BILLY: Not able to authenticate with Firebase - \(error)")
            } else {
                print("BILLY: Successfully authenticated with Firebase")
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailTextField.text, let pwd = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("BILLY: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("BILLY: User could not be added \(error)")
                        } else {
                            print("BILLY: Successfully added new user")
                        }
                    })
                }
            })
        }
        
    }
}


















