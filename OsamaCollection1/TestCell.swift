//
//  TestCell.swift
//  OsamaCollection1
//
//  Created by MAC on 13/11/2021.
//

import UIKit

class TestCell: UITableViewCell {
    @IBOutlet weak var categories: UILabel!
    @IBOutlet weak var collectioonView:UICollectionView!
    @IBOutlet weak var sellAll:UIButton!
    
    var row = 0
    var categoriesData: String? = nil{
        didSet{
            if let getData = categoriesData{
                DispatchQueue.main.async {
                    self.categories.text = getData
                }
            }
        }
    }
    
    var faheem:[Product] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectioonView.reloadData()
            }
        }
    }
    
    var products:[Product2] = []{
        didSet{
            DispatchQueue.main.async {
                self.collectioonView.reloadData()
            }
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        collectioonView.delegate = self
        collectioonView.dataSource = self
        collectioonView.register(UINib(nibName: String(describing: FaheemCell.self), bundle:.main), forCellWithReuseIdentifier: String(describing: FaheemCell.self))
        collectioonView.register(UINib(nibName: String(describing: ProductCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCollectionCell.self))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension TestCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch row{
            case 0:
                return faheem.count
            default:
                return products.count
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch row{
            case 0:
                 return self.configureFaheemCell(collectionView, cellForItemAt: indexPath)
            default:
                return self.configureProdcutCell(collectionView, cellForItemAt: indexPath)
        }
        
    }
    
    func configureFaheemCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FaheemCell.self), for: indexPath) as? FaheemCell else {return UICollectionViewCell()}
        cell.cellData = self.faheem[indexPath.item]
        return cell
    }
    
    func configureProdcutCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCollectionCell.self), for: indexPath) as? ProductCollectionCell else {return UICollectionViewCell()}
        cell.products2 = self.products[indexPath.item]
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
//
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch row{
            case 0:
                return CGSize(width: (self.collectioonView.bounds.width / 3) - 10, height: 120)
            default:
                return CGSize(width: (self.collectioonView.bounds.width / 4) - 10, height:140)
        }
    }
}
