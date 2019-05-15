//
//  ResetEmail&PassWord.swift
//  NIBMConnect
//
//  Created by Guest User on 5/15/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetEmail_PassWord: UIViewController {
    @IBOutlet weak var newNewPassWord: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var Change: UIButton!
    
 
    
    @IBAction func btnReset(_ sender: Any) {
        
        var newPassword = self.newNewPassWord.text
        
        let user = Auth.auth().currentUser
        var credential : AuthCredential
        
        credential = EmailAuthProvider.credential(withEmail: (user?.email)!, password: (user?.uid)!)
        
        
        // Prompt the user to re-provide their sign-in credentials
        
        user?.reauthenticate(with: credential) { error in
            if let error = error {
                // An error happened.
                let alert = UIAlertController(title: "Credential error", message: error.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title:"Click",style:.default,handler:nil))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                // User re-authenticated.
                Auth.auth().currentUser?.updatePassword(to: newPassword!) { (error) in
                    
                    if error != nil {
                        let alert = UIAlertController(title: "Reset Password", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title:"Click",style:.default,handler:nil))
                        
                        self.present(alert, animated: true, completion: nil)
                        
                    }else{
                        self.dismiss(animated: true, completion: nil)
                    }
                    
                }
            }
        }
        
        
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
