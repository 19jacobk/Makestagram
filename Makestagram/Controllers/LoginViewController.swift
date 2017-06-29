//
//  LoginViewController.swift
//  Makestagram
//
//  Created by Jacob Kim on 6/22/17.
//  Copyright © 2017 Jacob Kim. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
import FirebaseFacebookAuthUI
import FirebaseGoogleAuthUI

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        loginButton.layer.cornerRadius = 6
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let providers: [FUIAuthProvider] = [FUIGoogleAuth(), FUIFacebookAuth()]
        authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }

}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        
        guard let user = user
            else { return }
        
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                User.setCurrent(user, writeToUserDefaults: true)
                
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()

            } else {
                self.performSegue(withIdentifier: Constants.Segue.createUsername, sender: self)
            }
            
        }
    }
}

