//
//  MyProfile.swift
//  NIBMConnect
//
//  Created by Guest User on 5/13/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Kingfisher


class MyProfile: UIViewController {

    @IBOutlet weak var profilrPic: UIImageView!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var fristName: UILabel!
    
    
    
    var connectList = [ConnectModel]()
    var ref:DatabaseReference!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
        self.ref.child("NIBM").observeSingleEvent(of: .value, with: {(snapshot)in
            if snapshot.childrenCount>0{
                //self.connectList.removeAll();
                for Data in snapshot.children.allObjects as! [DataSnapshot]{
                    let dataObject = Data.value as? [String:AnyObject  ]
                    let FristName = dataObject? ["FristName"]
                    let LastName = dataObject? ["LastName"]
                    let NIC = dataObject? ["NIC"]
                    let AddressLineOne = dataObject? ["AddressLineOne"]
                    let AddressLineTwo = dataObject? ["AddressLineTwo"]
                    let City = dataObject? ["City"]
                    let PhoneNumber = dataObject? ["PhoneNumber"]
                    let Email = dataObject? ["Email"]
                    let ProfilePicture = dataObject? ["ProfilePicture"]
                    let FBProfileUrl = dataObject? ["FBProfileUrl"]
                    
                    let DataOject = ConnectModel (FristName:FristName as! String?,
                                                  LastName:LastName as! String?,
                                                  NIC:NIC as! String?,
                                                  AddressLineOne:AddressLineOne as! String?,
                                                  AddressLineTwo:AddressLineTwo as! String?,
                                                  City:City as! String?,
                                                  PhoneNumber:PhoneNumber as! String?,
                                                  Email:Email as! String?,
                                                  ProfilePicture:ProfilePicture as! String?,
                                                  FBProfileUrl:FBProfileUrl as! String?)
                    self.connectList.append(DataOject)
                }
                let  user = Auth.auth().currentUser
               
               
                self.fristName.text=user?.email
                var count = String(self.connectList.count)
                var Object :ConnectModel!
               
                //for obj in self.connectList{
                    //if (obj.Email == user?.email){
                        //Object=obj
                         //self.lastName.text="f"
                        
                    //}else{
                        //self.lastName.text="n"
                    //}
                //}
                
                let ob = self.connectList.first{$0.Email==user?.email}
                if ((ob) != nil){
                Object=ob
                self.fristName.text=Object.FristName
                self.lastName.text=Object.LastName
                    let Url = URL(string : (Object.ProfilePicture)!)
                    self.profilrPic.kf.setImage(with : Url)
                
                }else{
                self.lastName.text="n"
                }
            }
        })
        
        ref.observe(DataEventType.value, with: {(snapshot)in
            
        })
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
