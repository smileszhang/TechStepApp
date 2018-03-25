//
//  ContactViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/13.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit
import ContactsUI

class ContactViewController: UIViewController,CNContactPickerDelegate {

    @IBOutlet weak var send_button: UIButton!
    var count = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        send_button.isEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click_contacts(_ sender: Any) {
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker,animated: true,completion: nil)
    }
    func contactPicker(_ picker:CNContactPickerViewController, didSelect contacts: [CNContact]){
        count = contacts.count
        contacts.forEach{ contact in
            for number in contact.phoneNumbers{
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
            }
        }
        if (count>=5){
            send_button.isEnabled = true
        }
        
    
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController){
        print("Cancel contact Picker")
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
