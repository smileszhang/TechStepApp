//
//  SubProductViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/13.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit

class SubProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.8)
       // self.view.layer.shadowOffset = CGSize(0.0,0.0)
        showAnimate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX:1.3,y:1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration:0.25,animations:{
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX:1.0,y:1.0)
        })
    }
    @IBAction func close_popuoview(_ sender: Any) {
        removeAnimate()
    }
    
    @IBAction func close_pop2(_ sender: Any) {
        removeAnimate()
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX:1.3,y:1.3)
            self.view.alpha = 0.0
        },completion:{(finished:Bool)in
            if(finished)
            {
                self.willMove(toParentViewController: nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        })
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
