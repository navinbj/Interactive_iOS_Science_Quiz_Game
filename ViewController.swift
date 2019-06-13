//
//  ViewController.swift
//  Assignment1_IOS_NBajgai
//
//  Created by Bajgai Navin on 5/1/19.
//  Copyright © 2019 Bajgai Navin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var warningLbl: UILabel!
    
    //when the next button is clicked, do the following...
    @IBAction func nextBtn(_ sender: Any) {
        if nameTxt.text!.isEmpty || yearTxt.text!.isEmpty
        {
            print("name required!")
            warningLbl.text = "Name and Year required!"
        }
        else
        {
            let name = nameTxt.text
            let year = yearTxt.text
            let age = ageTxt.text
            
            print(name! + "\t" + year! + "\t" + age!)
            //instantiating a storyboard for the game view controller
            let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gvStoryboard") as! GameViewController
            gameVC.playerName = name!
            gameVC.playerYear = year!
            self.navigationController?.pushViewController(gameVC, animated: true)   //directing player to a game view controller
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Game Home"
        self.nameTxt.delegate = self
        self.yearTxt.delegate = self
        self.ageTxt.delegate = self 
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
