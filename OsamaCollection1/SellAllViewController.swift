//
//  SellAllViewController.swift
//  OsamaCollection1
//
//  Created by MAC on 14/11/2021.
//

import UIKit

class SellAllViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    var btn = 0
    
    var faheem :[Product] = []
    var products: [Product2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: FaheemCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: FaheemCell.self))
        collectionView.register(UINib(nibName: String(describing: ProductCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCollectionCell.self))
    }
    
}

extension SellAllViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch btn {
            case 0:
                return faheem.count
            default:
                return products.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch btn{
            case 0:
                
                return self.configureFaheemCell(collectionView, cellForItemAt: indexPath)
            default:
                return self.configureProductCell(collectionView, cellForItemAt: indexPath)
            
        }
    }
    
    func configureFaheemCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let faheemCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FaheemCell.self), for: indexPath) as? FaheemCell else {return UICollectionViewCell()}
        faheemCell.cellData = self.faheem[indexPath.item]
//        faheemCell.contentView.isHidden = true
        return faheemCell
    }
    
    func configureProductCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCollectionCell.self), for: indexPath) as? ProductCollectionCell else {return UICollectionViewCell()}
        productCell.products2 = self.products[indexPath.item]
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch btn{
            case 0:
                return CGSize(width: (self.collectionView.bounds.width / 3) - 10, height: 140)
            default:
                return CGSize(width: (self.collectionView.bounds.width / 4) - 10, height: 160)
            
        }
    }
}
