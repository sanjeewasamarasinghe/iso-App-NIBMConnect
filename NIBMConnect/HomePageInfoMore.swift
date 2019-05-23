//
//  HomePageInfoMore.swift
//  NIBMConnect
//
//  Created by Guest User on 5/13/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Kingfisher


class HomePageInfoMore: UIViewController {
    
    var Person : ConnectModel?
// lbl commiting
    @IBOutlet weak var lblFn: UILabel!
    @IBOutlet weak var lblLn: UILabel!
    @IBOutlet weak var lblPhn: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    
    
    @IBOutlet weak var ImgPicture: UIImageView!
    @IBOutlet weak var lblTital: UILabel!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.lblTital.text = Person?.FristName
        self.lblFn.text = Person?.LastName
        self.lblLn.text = Person?.NIC
        self.lblPhn.text = Person?.PhoneNumber
        self.lblEmail.text = Person?.Email
        
        image()
    }
    
    func image(){
        
        let Url = URL(string : (Person?.ProfilePicture!)!)
        ImgPicture.kf.setImage(with : Url)
        
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
