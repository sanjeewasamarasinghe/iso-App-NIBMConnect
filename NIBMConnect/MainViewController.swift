//
//  MainViewController.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class MainViewController: UIViewController {

    @IBOutlet weak var MainNext: UIButton!

    @IBOutlet weak var SingInOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //GIDSignIn.sharedInstance()?.uiDelegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func singInOutBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "singInOut", sender: nil)
    }
    

    
    @IBAction func showNext(_ sender: Any) {
        self.performSegue(withIdentifier: "LogIn", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        AppTempData.userHandleApp=Auth.auth().addStateDidChangeListener{(auth,user)in
            if user == nil{
                self.performSegue(withIdentifier: "LogIn", sender: nil)
            }else{
                self.performSegue(withIdentifier: "singInOut", sender: nil)
            }
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(AppTempData.userHandleApp!)
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
