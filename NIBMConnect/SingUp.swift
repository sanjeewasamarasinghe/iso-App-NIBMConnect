//
//  SingUp.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SingUp: UIViewController {
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSingIn: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSingIn.layer.cornerRadius = btnSingIn.frame.height/2
        btnBack.layer.cornerRadius = btnBack.frame.height/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSingIn(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPassword.text! ){
            (user,error)in
            if error != nil {
                let alert = UIAlertController(title: "Singin Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Click",style:.default,handler:nil))
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                self.dismiss(animated: true, completion: nil)
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
