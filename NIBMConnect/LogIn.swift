//
//  LogIn.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class LogIn: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSingUp(_ sender: Any) {
        self.performSegue(withIdentifier: "SingUpOut", sender: nil)
    }
    @IBAction func btnLogin(_ sender: Any) {
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
