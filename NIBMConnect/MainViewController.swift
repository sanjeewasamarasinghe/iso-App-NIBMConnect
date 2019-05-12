//
//  MainViewController.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var MainNext: UIButton!
    @IBOutlet weak var MainSingIn: UIButton!
    @IBOutlet weak var singIn: UIButton!
    @IBOutlet weak var SingInOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func singInOutBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "singInOut", sender: nil)
    }
    
    @IBAction func singInBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "singInOut", sender: nil)
    }
    @IBAction func showSingInPage(_ sender: Any) {
        self.performSegue(withIdentifier: "singInOut", sender: nil)
    }
    
    @IBAction func showNext(_ sender: Any) {
        self.performSegue(withIdentifier: "LogIn", sender: nil)
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
