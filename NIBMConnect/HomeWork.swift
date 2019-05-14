//
//  HomeWork.swift
//  NIBMConnect
//
//  Created by Guest User on 5/14/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class HomeWork: UIViewController {

    var txtList = String()
    
    @IBOutlet weak var txtAddHomeWork: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNextPage(_ sender: Any) {
    self.performSegue(withIdentifier: "HomeWork", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? HomeWorkDetails {
            destination.model = txtList
        }
    }
    
    @IBAction func btnText(_ sender: Any) {
        txtfile()
        self.txtAddHomeWork.text=""
    }
    
    
    public func txtfile(){
        let fileName = "Text"
        let DocumenDirURL = try! FileManager.default.url(for:.documentDirectory,in:.userDomainMask,appropriateFor:nil,create:true)
        let fileURL = DocumenDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("File Path: \(fileURL.path) ")
        let writeString = "Write this text to the the file in swift "
        do{
            //write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
           
        } catch let error as NSError{
            print("Failed to write to URL")
            print(error)
            
        }
        var readString = ""
        do{
            readString = try String (contentsOf: fileURL)
        }catch let error as NSError{
            print("File to read file")
            print(error)
        }
    
        print("Content of the file \(readString)*")
        
        
        let fileUrlProject = Bundle.main.path(forResource: "HomeWork", ofType: "txt")
        
        //let fileNameWrite = "HomeWork"
        //let path = NSURL (fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileNameWrite)
        
        let writFileURL = "/Users/Guest/Desktop/nibm/NIBMConnect/HomeWork.txt"
        
        var readStringProject = ""
        do{
            readStringProject = try String(contentsOfFile: fileUrlProject!,encoding: String.Encoding.utf8)
        }catch let errro as NSError{
            print("Failed to read from project")
            print(errro)
        }
        print(readStringProject)
        let text = "\r\n\r\n"
        
        let homeWork = self.txtAddHomeWork.text
        
        let writeTxt = readStringProject+(text)+homeWork!
        
        //let dataObject = homeWork
        //let dataOject = TxtHomeWorkModel (HomeWORK:HomeWork as! String?)
        
        txtList = homeWork!
        
        do{
            //write to the file
           try writeTxt.write(toFile :writFileURL , atomically: false, encoding: String.Encoding.utf8)
            
        } catch let error as NSError{
            print("Failed to write to URL")
            print(error)
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controlle
     r using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
