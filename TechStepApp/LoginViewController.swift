//
//  LoginViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/8.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit
extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
class LoginViewController: UIViewController {

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
    

    @IBAction func LoginAction(_ sender: Any) {
        let userEmail = EmailText.text
        let userPassword = PasswordText.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if((userEmail?.isEmpty)!||(userPassword?.isEmpty)!){
            self.view.shake()}
        
        if(userEmail == userEmailStored)
        {
            if(userPasswordStored == userPassword)
            {
                //Login is successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                UserDefaults.standard.synchronize()
                self.performSegue(withIdentifier: "AfterLogin", sender: self)
                //self.dismiss(animated: true, completion: nil)
            }
            else{
                self.view.shake()
            }
        }
        else
        {
            self.view.shake()
        }
        
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
