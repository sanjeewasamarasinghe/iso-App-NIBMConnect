//
//  HomeWorkDetails.swift
//  NIBMConnect
//
//  Created by Guest User on 5/14/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class HomeWorkDetails: UIViewController {
    
    var model = [String]()

    //UI
    
    @IBOutlet weak var txtHomeWorkView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.txtHomeWorkView.text = ""
        
        //
        // Call Func
        //
        homwWorkAdd()
       
    }
    
    //
    // Func Home Work Add
    //
    public func homwWorkAdd(){
        let fileUrlProject = Bundle.main.path(forResource: "HomeWork", ofType: "txt")
        let Url = URL(fileURLWithPath : fileUrlProject!)
        
        //let writFileURL = Bundle.main.path(forResource: "HomeWork", ofType: "txt")
        
        //let fileNameWrite = "HomeWork"
        //let path = NSURL (fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileNameWrite)
        
        //let writFileURL = "/Users/Guest/Desktop/nibm/NIBMConnect/HomeWork.txt"
        
        var readStringProject = ""
        do{
            readStringProject = try NSString(contentsOf: Url,encoding: String.Encoding.utf8.rawValue) as String
        }catch let errro as NSError{
            print("Failed to read from project")
            print(errro)
        }
        print(readStringProject)
        
        var addText = ""
        
        //for txt in model.count{
            //addText = addText + "\r\n\r\n " + addText
        //}
        
        //var i=0;
        //while i <= model.count {
            //addText = addText + "\r\n\r\n " + model[i]
            
        //}
        
        if(String(model.count) == "0"){
            self.txtHomeWorkView.text = readStringProject+"\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) "
        }else if(String(model.count) == "1"){
            self.txtHomeWorkView.text = readStringProject+"\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) "+" "+model[0]
        }else if(String(model.count) == "2"){
            self.txtHomeWorkView.text = readStringProject+"\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) "+" "+model[0]+" "+model[1]
        }else if(String(model.count) == "3"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) "+" "+model[0]+" "+model[1]+" "+model[2]
        }else if(String(model.count) == "4"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]
            
        }else if(String(model.count) == "5"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]
            
        }else if(String(model.count) == "6"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]
            
        }else if(String(model.count) == "7"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]+" "+model[6]
            
        }else if(String(model.count) == "8"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]+" "+model[6]+" "+model[7]
            
        }else if(String(model.count) == "9"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]+" "+model[6]+" "+model[7]+" "+model[8]
            
        }else if(String(model.count) == "10"){
            self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]+" "+model[6]+" "+model[7]+" "+model[8]+" "+model[9]
            
        }else {
           self.txtHomeWorkView.text = readStringProject + "\r\n\r\n NEW NOTES -"+" ( "+String(model.count)+" ) " + model[0]+" "+model[1]+" "+model[2]+" "+model[3]+" "+model[4]+" "+model[5]+" "+model[6]+" "+model[7]+" "+model[8]+" "+model[9]
            
        }
        
        
        
        // Do any additional setup after loading the view.
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
