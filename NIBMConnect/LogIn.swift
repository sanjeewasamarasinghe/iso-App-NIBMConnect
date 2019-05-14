//
//  LogIn.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LogIn: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func forGetPassWord(_ sender: Any) {
    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSingUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SingUpOut", sender: nil)
    }
    @IBAction func btnLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.txtEmail.text!,password:self.txtPassword.text!){
            [weak self] user, error in guard let strongSelf = self else {return}
            //...
            if error != nil {
                let alert = UIAlertController(title: "login Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Click",style:.default,handler:nil))
                strongSelf.present(alert, animated: true, completion: nil)
                
            }else{
                strongSelf.dismiss(animated: true, completion: nil)
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
