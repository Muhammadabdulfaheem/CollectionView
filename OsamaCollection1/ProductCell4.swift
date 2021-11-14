//
//  ProductCell4.swift
//  OsamaCollection1
//
//  Created by MAC on 09/06/2021.
//

import UIKit

class ProductCell4: UITableViewCell {

    @IBOutlet weak var lblCategoires: UILabel!
    @IBOutlet weak var sellAll: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var row = 0
    
    var header: String? = nil {
        didSet{
         
            if let headerDetails = self.header{
                DispatchQueue.main.async {
                    self.lblCategoires.text = headerDetails
                }
            }
        }
    }
    var productsData:[Product] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

            
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: String(describing: ProductCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCell.self))
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension ProductCell4: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.configureProductCell(collectionView, cellForItemAt: indexPath)
      
    }
    func configureProductCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        productCell.product = self.productsData[indexPath.row]
    return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let width = (self.view.bounds.width / 3) - 10
       // let width = (self.collectionView.bounds.width)
        //return CGSize(width: width, height:300)
        let width = collectionView.bounds.width
        return CGSize(width: width/3, height: width/3)
    //  return CGSize(width: 120, height:160)
    }
}

