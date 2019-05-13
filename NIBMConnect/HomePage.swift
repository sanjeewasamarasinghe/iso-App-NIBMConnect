//
//  HomePage.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Alamofire
import AlamofireImage

class HomePage: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for:indexPath)as! Connect
        
        let Detail: ConnectModel
        
        Detail = connectList [indexPath.row]
        
        Cell.lblFristName.text = Detail.FristName
        Cell.lblLastName.text = Detail.LastName
        Cell.lblCity.text = Detail.City
        
        Alamofire.request(Detail.ProfilePicture!).responseImage(completionHandler:{(response)in
            print(response)
            
            if let imgD = response.result.value{
                print("image downloaded:\(imgD)")
                Cell.personImg.image=imgD
            }else{
                print("error")
            }
            
        })
        
        return Cell
        
    }
    


    
    @IBOutlet weak var tblConnect: UITableView!
    
    var connectList = [ConnectModel]()
    var ref:DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
        self.ref.child("NIBM").observeSingleEvent(of: .value, with: {(snapshot)in
            if snapshot.childrenCount>0{
                self.connectList.removeAll();
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
                self.tblConnect.reloadData()
            }
        })
        
        ref.observe(DataEventType.value, with: {(snapshot)in
            
        })
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
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
