//
//  RegisterViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/8.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        let emailText = EmailText.text
        let passwordText = PasswordText.text
        
        //check for empty fields
        if((emailText?.isEmpty)! || (passwordText?.isEmpty)!){
            //Display alert message
            displayMyAlertMessage(userMessage: "All fiels are required")
            return
        }
        
        //store data
        UserDefaults.standard.set(emailText,forKey:"userEmail")
        UserDefaults.standard.set(passwordText,forKey:"userPassword")
        UserDefaults.standard.synchronize();
        
        //display alert message with confirmation
        var myAlert = UIAlertController(title:"Alert",message:"Registration is successful!",preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default){
            action in
            self.performSegue(withIdentifier:"RegistertoLogin", sender: self)
           // self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        var myAlert = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default,handler:nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated:true,completion:nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
