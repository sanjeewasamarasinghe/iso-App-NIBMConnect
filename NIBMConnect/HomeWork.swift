//
//  HomeWork.swift
//  NIBMConnect
//
//  Created by Guest User on 5/14/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class HomeWork: UIViewController {
    //array list
    var txtList = [String]()
    //UI
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var btnHomeWork: UIButton!
    @IBOutlet weak var btnEntre: UIButton!
    @IBOutlet weak var txtAddHomeWork: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //
        // UI Buttons
        //
        btnHomeWork.layer.cornerRadius = btnHomeWork.frame.height/2
        btnEntre.layer.cornerRadius = btnEntre.frame.height/2
        
        // user defoult
        self.lblNote.text=""
        
    }
    @IBOutlet weak var countLable: UILabel!
    
    
    
    @IBAction func btnNextPage(_ sender: Any) {
    self.performSegue(withIdentifier: "HomeWork", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? HomeWorkDetails {
            destination.model = txtList
        }
    }
    
    @IBAction func btnText(_ sender: Any) {
        
        //user default
        
        let noteone = self.txtAddHomeWork.text
        
        let note = noteone
        
        UserDefaults.standard.set(note,forKey: "note")
        
        
        self.lblNote.text = UserDefaults.standard.string(forKey: "note");
        
        txtfile()
        self.txtAddHomeWork.text=""
        if(txtList.count==10){
            self.countLable.text = "FULL"+" NOTE"
        }else{
            self.countLable.text = String(txtList.count)+" NOTE"
        }
        
    }
    
    public func shoeActivity (){
        //self.view.bringSubviewToFront()
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
        let NoteCount = String(txtList.count + 1 )
        let text = " \r\n\r\n \(NoteCount) NOTES - "
        
        let homeWork = self.txtAddHomeWork.text
        
        
        
        //let dataObject = homeWork
        //let dataOject = TxtHomeWorkModel (HomeWORK:HomeWork as! String?)
        
        txtList.append(homeWork!)
        
        var writeTxt = ""
        
        if(String(txtList.count) == "0"){
        writeTxt = readStringProject+" NOTES "
        }else if(String(txtList.count) == "1"){
          writeTxt = readStringProject+text+txtList[0]
        }
        else if(String(txtList.count) == "2"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]
        }else if(String(txtList.count) == "3"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]
        }else if(String(txtList.count) == "4"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]
        }else if(String(txtList.count) == "5"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]
        }else if(String(txtList.count) == "6"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]
        }else if(String(txtList.count) == "7"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]+" "+txtList[6]
        }else if(String(txtList.count) == "8"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]+" "+txtList[6]+" "+txtList[7]
        }else if(String(txtList.count) == "9"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]+" "+txtList[6]+" "+txtList[7]+" "+txtList[8]
        }else if(String(txtList.count) == "10"){
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]+" "+txtList[6]+" "+txtList[7]+" "+txtList[8]+" "+txtList[9]
        }else{
            writeTxt = readStringProject+(text)+txtList[0]+" "+txtList[1]+" "+txtList[2]+" "+txtList[3]+" "+txtList[4]+" "+txtList[5]+" "+txtList[6]+" "+txtList[7]+" "+txtList[8]+" "+txtList[9]
        }
        
        
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
