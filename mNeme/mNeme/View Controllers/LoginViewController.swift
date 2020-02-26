//
//  LoginViewController.swift
//  mNeme
//
//  Created by Dennis Rudolph on 2/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
//import FBSDKLoginKit
import FacebookLogin

class LoginViewController: UIViewController, GIDSignInDelegate {

    let userController = UserController()
    var signingUp = false
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailSignInButton: UIButton!
    @IBOutlet weak var emailCancelButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var largeNavView: UIView!
    @IBOutlet weak var bottomTextLabel: UILabel!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var bottomNavView: UIView!
    
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func emailButtonPressed(_ sender: Any) {
        toggleAllButtons()
        
    }
    
    @IBAction func emailSignInButton(_ sender: Any) {
        if signingUp {
            createAccountWithEmail()
        } else {
            signInWithEmail()
        }
    }
    
    @IBAction func emailCancelButton(_ sender: Any) {
        toggleAllButtons()
    }
    
    
    @IBAction func googleSignInPressed(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    private func updateViews() {
        hideEmailButtons()
        emailButtonText()
        largeNavView.backgroundColor = UIColor.mNeme.orangeBlaze
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        bottomNavView.backgroundColor = UIColor.mNeme.orangeBlaze
        bottomImageViewandLabel()
    
    }

    private func signInWithAuthResultUID(uid: String) {
        userController.user = User(uid)
        userController.getUserPreferences {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "MainSegue", sender: self)
            }
        }
    }
    
    
    func loginManagerDidComplete(_ result: LoginResult) {
        
        switch result {
        case .cancelled:
            print("cancelled")

        case .failed:
           print("failed")

        case .success:
            print("success")
            //self.performSegue(withIdentifier: "MainSegue", sender: self)
        }
    }

    @IBAction private func loginWithReadPermissions() {
        let loginManager = LoginManager()
        loginManager.logIn(
            permissions: [.publicProfile, .email],
            viewController: self
        ) { result in
            self.loginManagerDidComplete(result)
            guard let accessToken = AccessToken.current?.tokenString else { return
                print("no token")
            }
            print("\(AccessToken.current?.appID)")
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                } else {
                    print(authResult?.credential as Any)
                    if let uid = authResult?.user.uid {
                        self.signInWithAuthResultUID(uid: uid)
                    }
                    print("Login Successful")
                }
            }
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                if let uid = authResult?.user.uid {
                    self.signInWithAuthResultUID(uid: uid)
                }
            }
        }
    }
    
    private func createAccountWithEmail() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                NSLog("Error dealing with email login creation: \(error)" )
                return
            }
            
            if let authResult = authResult {
                print("Sign up Auth Result has succeeded \(String(describing: authResult.credential))")
                let uid = authResult.user.uid
                self.signInWithAuthResultUID(uid: uid)
                //self.performSegue(withIdentifier: "MainSegue", sender: self)
            }
        }
        
        // TODO: Create password length requirement
        
    }
    
    private func signInWithEmail() {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                NSLog("Error dealing with email sign in: \(error)" )
                return
            }
            
            if let authResult = authResult {
                print("Sign in Auth Result has succeeded \(String(describing: authResult.credential))")
                let uid = authResult.user.uid
                self.signInWithAuthResultUID(uid: uid)
                //self.performSegue(withIdentifier: "MainSegue", sender: self)
            }
        }
    }
    
    private func toggleAllButtons() {
        emailButton.isHidden.toggle()
        googleLoginButton.isHidden.toggle()
        facebookLoginButton.isHidden.toggle()
        emailTextField.isHidden.toggle()
        passwordTextField.isHidden.toggle()
        emailSignInButton.isHidden.toggle()
        emailCancelButton.isHidden.toggle()
        
    }
    
    private func hideEmailButtons() {
        emailTextField.isHidden = true
        passwordTextField.isHidden = true
        emailSignInButton.isHidden = true
        emailCancelButton.isHidden = true
    }
    
    private func emailButtonText() {
        if signingUp {
            facebookLoginButton.setImage(UIImage(named: "Sign Up with Facebook"), for: .normal)
            googleLoginButton.setImage(UIImage(named: "Sign Up with Google"), for: .normal)
            emailButton.setImage(UIImage(named: "Sign Up with Email"), for: .normal)
            emailSignInButton.setImage(UIImage(named: "Sign Up"), for: .normal)
        } else {
            facebookLoginButton.setImage(UIImage(named: "Sign in with Facebook"), for: .normal)
            googleLoginButton.setImage(UIImage(named: "Sign in with Google"), for: .normal)
            emailButton.setImage(UIImage(named: "Sign in with Email"), for: .normal)
            emailSignInButton.setImage(UIImage(named: "Sign In"), for: .normal)
        }
    }
    
    private func bottomImageViewandLabel() {
        if signingUp {
            bottomImageView.image = UIImage(named: "Basketball-Mastery-Illustrations")
            // bottom constraint = 133
            bottomTextLabel.text = "Join mNeme Today"
        } else {
            bottomImageView.image = UIImage(named: "Banner Illustration")
            // bottom constraint = 111
            bottomTextLabel.text = "The best way to study efficiently 😎"
        }
    }
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if segue.identifier == "MainSegue" {
            if let destinationVC = segue.destination as? TabViewController {
                destinationVC.userController = self.userController
            }
        }
     }
    
}

extension LoginViewController: LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let accessToken = AccessToken.current?.tokenString else { return }
        let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                print("Login Successful")
            }
        }
    }
        
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
}
