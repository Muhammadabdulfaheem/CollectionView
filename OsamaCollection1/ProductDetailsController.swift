//
//  ProductDetailsController.swift
//  OsamaCollection1
//
//  Created by MAC on 07/11/2021.
//

import UIKit

class ProductDetailsController: UIViewController {

    @IBOutlet weak var proImage:UIImageView!
    @IBOutlet weak var price:UILabel!
    @IBOutlet weak var category:UILabel!
    var proImg:String? = nil
    var pri:String? = nil
    var cate:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        proImg.layer.masksToBounds = true
//        userProfile.layer.borderWidth = 2
//        userProfile.layer.borderColor = UIColor.lightGray.cgColor
//        userProfile.layer.cornerRadius = userProfile.frame.size.height / 2
        if let getImage = proImg{
            proImage.layer.cornerRadius = proImage.frame.size.height / 2
            self.proImage.image = UIImage(named: getImage)
        }
        self.price.text = pri
        self.category.text = cate
    }
    

 

}
