//
//  ProductCell2.swift
//  OsamaCollection1
//
//  Created by MAC on 08/06/2021.
//

import UIKit

class ProductCell2: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    var product: Product? = nil{
        didSet{
            if let product = self.product{
                DispatchQueue.main.async {
                    self.productImage.image = UIImage(named: product.productImage)
                    self.lblProductName.text = product.category
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
