//
//  ViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/7.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label_loveday = UILabel(frame: CGRect(x:117,y:277,width:160,height:40))
        label_loveday.center = CGPoint(x: 200, y: 285)
        label_loveday.text = "Love Every Day"
        self.view.addSubview(label_loveday)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            label_loveday.isHidden = true
            let label_lace = UILabel(frame: CGRect(x:117,y:277,width:160,height:40))
            label_lace.center = CGPoint(x: 200, y: 285)
         //   label_lace.textAlignment = .center
            label_lace.text = "Love YOUR LACES"
            self.view.addSubview(label_lace)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

