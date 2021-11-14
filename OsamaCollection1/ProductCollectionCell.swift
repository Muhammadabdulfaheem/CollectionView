//
//  ProductCollectionCell.swift
//  OsamaCollection1
//
//  Created by MAC on 07/11/2021.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {
    @IBOutlet weak var proImage:UIImageView!
    @IBOutlet weak var lblDetails:UILabel!

    var products2: Product2? = nil{
        didSet{
            if let getData = products2{
                DispatchQueue.main.async {
                    self.proImage.image = UIImage(named: getData.productImage2)
                    self.lblDetails.text = getData.ProductCategory2
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        proImage.layer.cornerRadius = proImage.frame.size.height / 2
        proImage.clipsToBounds = true
    }

}
