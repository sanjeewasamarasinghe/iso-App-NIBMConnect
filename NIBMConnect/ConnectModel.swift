//
//  ConnectModel.swift
//  NIBMConnect
//
//  Created by Guest User on 5/12/19.
//  Copyright © 2019 USER. All rights reserved.
//

class ConnectModel{
    var FristName:String?
    var LastName :String?
    var NIC :String?
    var AddressLineOne :String?
    var AddressLineTwo :String?
    var City: String?
    var PhoneNumber :String?
    var Email :String?
    var ProfilePicture :String?
    var FBProfileUrl :String?
    
    init (FristName:String?,LastName:String?,NIC:String?,AddressLineOne:String?,AddressLineTwo:String?,City:String?,PhoneNumber:String?,Email:String?,ProfilePicture:String?,FBProfileUrl:String?){
        self.FristName=FristName;
        self.LastName=LastName;
        self.NIC=NIC;
        self.AddressLineOne=AddressLineOne;
        self.AddressLineTwo=AddressLineTwo;
        self.City=City;
        self.PhoneNumber=PhoneNumber;
        self.Email=Email;
        self.ProfilePicture=ProfilePicture;
        self.FBProfileUrl=FBProfileUrl;
    }
}
