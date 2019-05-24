//
//  MyProfileTouchID.swift
//  NIBMConnect
//
//  Created by Guest User on 5/13/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class MyProfileTouchID: UIViewController {

    @IBOutlet weak var btnMyProfile: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let IDCheck = BiometricIDAuth()
    
    func touchIDLoginAction(){
        IDCheck.authenticateUser(){[weak self] message  in
            if let message = message {
                let alertview = UIAlertController(title: "Authentication", message: message, preferredStyle: .alert)
                
                let OkAction  = UIAlertAction (title: "Ok", style: .default, handler: {(action :UIAlertAction) in
                    print("Try Again !")
                    
                })
                alertview.addAction(OkAction)
                self!.present(alertview,animated: true)
            }else{
                 self?.performSegue(withIdentifier: "MyProfile", sender: nil)
            }
            
        }
    }
    
    @IBAction func btnMyProfilePage(_ sender: Any) {
        self.performSegue(withIdentifier: "MyProfile", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.performSegue(withIdentifier: "MyProfile", sender: nil)
        touchIDLoginAction()
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
