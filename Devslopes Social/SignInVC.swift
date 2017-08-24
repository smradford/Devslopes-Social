//
//  SignInVC.swift
//  Devslopes Social
//
//  Created by Georgie Kirby on 09/08/2017.
//  Copyright © 2017 Scott Radford. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyTextField!
    @IBOutlet weak var pwordField: FancyTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInTapped(_ sender: Any) {
        if let email = emailField.text, let pword = pwordField.text {
            Auth.auth().signIn(withEmail: email, password: pword, completion: { (user, error) in
                if error == nil {
                    print ("SCOTT: Email user authenticated with Firedbase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pword, completion: {(user, error) in
                        if error != nil {
                            print("SCOTT: Unable to authenticate with Firebase unsin email")
                        } else {
                            print("Successfully authenticated with Firebase")
                        }
                    })
                }
            })
            
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("SCOTT: Unable to authenticate with Firebase - \(String(describing: error))")
            } else {
                print("SCOTT: Successfully autenticated with Firebase")
            }
                
            })
        
    }
}

