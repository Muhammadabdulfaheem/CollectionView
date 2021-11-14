//
//  ProductCell.swift
//  OsamaCollection1
//
//  Created by MAC on 08/06/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var lblProductImage: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    
    var product : Product! = nil{
        didSet{
            DispatchQueue.main.async {
//                self.productImage.backgroundColor = .lightGray
//                self.productImage.layer.cornerRadius = self.productImage.frame.height/2
                
                self.lblProductImage.image = UIImage(named: self.product.productImage)
                self.lblPrice.text = self.product.price
                self.lblCategory.text = self.product.category
                
            }
            
        }
    
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
