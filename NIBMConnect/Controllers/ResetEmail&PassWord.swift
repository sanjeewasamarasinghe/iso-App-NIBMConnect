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
    
    //
    //UI
    //
    @IBOutlet weak var newNewPassWord: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txEmail: UITextField!
    @IBOutlet weak var btnReset: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //
        //
        //
        btnReset.layer.cornerRadius = btnReset.frame.height/2
    }
    
    //UI
    @IBOutlet weak var Change: UIButton!
    
 
    // Func Reset
    @IBAction func btnReset(_ sender: Any) {
        
        var newPassword = self.newNewPassWord.text
        var curresntPassword = self.txtPassword.text
        var NewEmail = self.txEmail.text
        
        let user = Auth.auth().currentUser
        var credential : AuthCredential
        
        credential = EmailAuthProvider.credential(withEmail: (user?.email)!, password: curresntPassword!)
        
        
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
                
                //new email
                Auth.auth().currentUser?.updateEmail(to: NewEmail!) { (error) in
                    // ...
                    if error != nil {
                        let alert = UIAlertController(title: "Reset Email", message: error?.localizedDescription, preferredStyle: .alert)
                        
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
