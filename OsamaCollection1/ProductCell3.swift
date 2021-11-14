//
//  ProductCell3.swift
//  OsamaCollection1
//
//  Created by MAC on 09/06/2021.
//

import UIKit

/*
protocol CellDelegate: class{
    func cellTaped(tag: Int)//for sell all button 1st method
}
*/
class ProductCell3: UITableViewCell {
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
   // weak var btnDelegate: CellDelegate? //for sell all button 1st method
    
    @IBOutlet weak var collectionView: UICollectionView!
    var row = 0
    var products:[Product] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var products2: [Product2] = [] {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    var header:String? = nil {
        didSet{
            if let header = self.header{
                DispatchQueue.main.async {
                    self.lblHeading.text = header
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: String(describing: ProductCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCell.self))
        self.collectionView.register(UINib(nibName: String(describing: ProductCell2.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCell2.self))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProductCell3: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.count
        
        /*
        switch section {
        case 0:
            return self.products2.count
        case 1:
            return self.products.count
        default:
            return 1
        }
 */
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if row == 0  {
            return self.configureProduct2Cell(collectionView, cellForItemAt: indexPath)
        }else{
            return self.configureProductCell(collectionView, cellForItemAt: indexPath)
        }
    }
    
    
    func configureProduct2Cell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell2.self), for: indexPath) as? ProductCell2 else {return UICollectionViewCell()}
        cell.product = products[indexPath.item]
    return cell
    }
    
    func configureProductCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell else {return UICollectionViewCell()}
        productCell.product = self.products[indexPath.item]
    return productCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.bounds.width / 2 - 20
        let width2 = self.collectionView.bounds.width / 3 //increase the size so we add  not subtract
        return self.row == 0 ? CGSize(width: width, height: self.bounds.height) : CGSize(width: width2, height: self.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let productDetails = storyboard.instantiateViewController(withIdentifier: String(describing: CollectionController.self)) as? CollectionController else {return}
        UIApplication.shared.topViewController()?.navigationController?.pushViewController(productDetails, animated: true)
        
 
    }
    //
    @IBAction func btnCellTapped(_ sender: UIButton){
        //btnDelegate? .cellTaped(tag: sender.tag) //for sell all button 1st method
    }
 

}
