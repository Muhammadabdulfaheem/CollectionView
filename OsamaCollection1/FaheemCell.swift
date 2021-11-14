//
//  FaheemCell.swift
//  OsamaCollection1
//
//  Created by MAC on 06/11/2021.
//

import UIKit

class FaheemCell: UICollectionViewCell {

    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var category: UILabel!
    
    var cellData:Product? = nil{
        didSet{
            if let getData = cellData{
                DispatchQueue.main.async {
                    self.proImg.image = UIImage(named: getData.productImage)
                    self.price.text = getData.price
                    self.category.text = getData.category
                }
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        proImg.layer.cornerRadius = proImg.frame.size.height / 2
        proImg.clipsToBounds = true
    
        
    }

}
