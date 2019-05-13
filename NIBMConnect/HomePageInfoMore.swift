//
//  HomePageInfoMore.swift
//  NIBMConnect
//
//  Created by Guest User on 5/13/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit


class HomePageInfoMore: UIViewController {
    
    var conncet : ConnectModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.lblTital.text = conncet.FristName
    }
    
    
    
    @IBOutlet weak var ImgPicture: UIImageView!
    @IBOutlet weak var lblTital: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
