//
//  ProductViewController.swift
//  TechStepApp
//
//  Created by smile on 2018/3/12.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
//    let items = [UIImage(named:"1"),UIImage(named:"2"),UIImage(named:"3"),UIImage(named:"4"),UIImage(named:"5"),UIImage(named:"6"),UIImage(named:"7"),UIImage(named:"8"),UIImage(named:"9"),UIImage(named:"10")]
    var productDelegate = (UIApplication.shared.delegate as! AppDelegate)

    
    var items: [String] = []
    var imageitems:[UIImage] = []
    
    let user = "ck_4656be6e0a6e14beb17cf96865d8142217bdaeac"
    let password = "cs_78dcc0128a4c966bd49bd015f4491b9727d13e3a"

    override func viewDidLoad() {
        super.viewDidLoad()

//        let popvc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "Sub_ID")as! SubProductViewController
//        self.addChildViewController(popvc)
//        popvc.view.frame = self.view.frame
//        self.view.addSubview(popvc.view)
//        popvc.didMove(toParentViewController: self)
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDelegate.imageitems.count
      //  return self.imageitems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCollectionViewCell
        
        cell.myImage.image = productDelegate.imageitems[indexPath.row]
          //  self.imageitems[indexPath.row]
        
        return cell
    
    }
    
    func downloadImage(_ i:Int){
        
        let url = URL(string: self.items[i])
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.imageitems.append(UIImage(data: data!)!)
        //imageView.image = UIImage(data: data!)
    }
    
    
    
    func getproducts(){
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        var i = 0
        Alamofire.request("https://techstep.io/wp-json/wc/v2/products",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                let json = JSON(response.result.value)
                while(i<json.count){
                    let image = String(describing: json[i]["images"][0]["src"])
                    self.items.append(image)
                    self.downloadImage(i)
                    i += 1
                }
        }
     
    }
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

