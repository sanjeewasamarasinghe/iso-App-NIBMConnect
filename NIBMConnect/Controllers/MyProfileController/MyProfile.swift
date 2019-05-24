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

    // UI Commponents
    
    @IBOutlet weak var profilrPic: UIImageView!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var fristName: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var FbProfileUrl: UILabel!
    @IBOutlet weak var AddressOne: UILabel!
    @IBOutlet weak var AddressTwo: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var NIC: UILabel!
    @IBOutlet weak var Age: UILabel!
    
    @IBOutlet weak var UiViewSelect: UIView!
    @IBOutlet weak var viewHight : NSLayoutConstraint!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    // Array
    
    var connectList = [ConnectModel]()
    var ref:DatabaseReference!
    
    // Amimation select
    
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //
        //
        //
        
        //Func Get Data
        
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
                self.phoneNo.text=Object.PhoneNumber
                self.AddressOne.text=Object.AddressLineOne
                self.AddressTwo.text=Object.AddressLineTwo
                self.Email.text=Object.Email
                self.City.text=Object.City
                self.FbProfileUrl.text=Object.FBProfileUrl
                self.NIC.text=Object.NIC
                self.Age.text="32 Years"
                
                
                    
                
                    let Url = URL(string : (Object.ProfilePicture)!)
                    self.profilrPic.kf.setImage(with : Url)
                
                }else{
                self.lastName.text="n"
                    //enter alert
                }
            }
        })
        
        ref.observe(DataEventType.value, with: {(snapshot)in
            
        })
    }
   
    //animation
    
    //override func viewDidAppear(_ animated: Bool) {
        
        //self.viewHight.constant = 20.0
        //self.viewWidth.constant =  20.0
        
        //UIView.animate(withDuration: 1.5, delay:0, usingSpringWithDamping:0.2 ,initialSpringVelocity:5.0 ,options : [],animations: {
            //self.view.layoutIfNeeded()
            
        //}){(completed) in
            
            
        //}
        
    //}
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
