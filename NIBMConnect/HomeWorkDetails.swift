//
//  HomeWorkDetails.swift
//  NIBMConnect
//
//  Created by Guest User on 5/14/19.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

class HomeWorkDetails: UIViewController {
    
    var model : String?

    @IBOutlet weak var txtHomeWorkView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
         self.txtHomeWorkView.text = ""
        homwWorkAdd()
       
    }
    
    public func homwWorkAdd(){
        let fileUrlProject = Bundle.main.path(forResource: "HomeWork", ofType: "txt")
        
        //let fileNameWrite = "HomeWork"
        //let path = NSURL (fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(fileNameWrite)
        
        //let writFileURL = "/Users/Guest/Desktop/nibm/NIBMConnect/HomeWork.txt"
        
        var readStringProject = ""
        do{
            readStringProject = try String(contentsOfFile: fileUrlProject!,encoding: String.Encoding.utf8)
        }catch let errro as NSError{
            print("Failed to read from project")
            print(errro)
        }
        print(readStringProject)
        self.txtHomeWorkView.text = readStringProject + model! ?? ""
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
