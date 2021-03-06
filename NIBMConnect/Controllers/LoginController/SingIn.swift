//
//  SingIn.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SingIn: UIViewController {
    
    // Buttons
    
    @IBOutlet weak var btnReSet: UIButton!
    @IBOutlet weak var btnSingOut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // UI
        btnSingOut.layer.cornerRadius = btnSingOut.frame.height/2
        btnReSet.layer.cornerRadius = btnReSet.frame.height/2
        
    }
    
    //Back PAGE
    
    @IBAction func resetPassword(_ sender: Any) {
        self.performSegue(withIdentifier: "Reset", sender: nil)
    }
    
    // SING OUT Func
    
    @IBAction func btnSingOutTwo(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion:    nil)
            
        }catch let signOutError as NSError
        {
            print ("Eror signing out: %@", signOutError)
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
