//
//  ProductDetailsController1.swift
//  OsamaCollection1
//
//  Created by MAC on 08/06/2021.
//

import UIKit

class ProductDetailsController1: UIViewController {

    var productImage: String? = nil
    var productPrice:String? = nil
    
    @IBOutlet weak var lblProductIamge2: UIImageView!
    @IBOutlet weak var lblProductPrice2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let productImage2 = productImage{
            self.lblProductIamge2.image = UIImage(named: productImage2)
        }
        self.lblProductPrice2.text = self.productPrice
       
        // Do any additional setup after loading the view.
    }
}
