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
}

