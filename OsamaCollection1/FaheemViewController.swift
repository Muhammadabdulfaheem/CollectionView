//
//  FaheemViewController.swift
//  OsamaCollection1
//
//  Created by MAC on 06/11/2021.
//

import UIKit

class FaheemViewController: UIViewController {

    @IBOutlet weak var collectionView:UICollectionView!
    var products : [Product] = [
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes"),
        Product(productImage: "mens", price: "$120", category: "Clothes")
    ]
    
    var products2: [Product2] = [
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep"),
        Product2(productImage2: "mens", ProductCategory2: "I love Allah Please help me Allah and I want to be a successfull ios developer in the world Allah hlep")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: FaheemCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: FaheemCell.self))
        collectionView.register(UINib(nibName: String(describing: ProductCollectionCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCollectionCell.self))
       
    }
   
}

extension FaheemViewController:UICollectionViewDelegate,UICollectionViewDataSource,
                               UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    
        switch section{
            case 0:
                return products.count
            default:
                return products2.count
            
        }
        
       // return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
            case 0:
                return self.configureProductCell(collectionView, cellForItemAt: indexPath)
            default:
                return self.configureProdct2Cell(collectionView, cellForItemAt: indexPath)
            
        }
        
    }
    
    
    func configureProductCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FaheemCell.self), for: indexPath) as? FaheemCell else {
            return UICollectionViewCell()
        }
        
        productCell.cellData = products[indexPath.item]
        return productCell
    }
    
   
    
    func configureProdct2Cell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let produdctCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCollectionCell.self), for: indexPath) as? ProductCollectionCell else {return UICollectionViewCell()
        }
        
        produdctCell2.products2 = products2[indexPath.item]
        return produdctCell2
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.section{
            case 0:
                self.gotoProductDetails(product: self.products[indexPath.row])
            default:
                self.gotoProductDetails2(product: self.products2[indexPath.row])
            
        }
    
    }
    
   
    
    func gotoProductDetails(product:Product){
        guard let productDetails = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProductDetailsController.self)) as? ProductDetailsController else {return}
        productDetails.proImg = product.productImage
        productDetails.cate = product.category
        productDetails.pri = product.price
        self.navigationController?.pushViewController(productDetails, animated: true)
        
    }
    
    func gotoProductDetails2(product:Product2){
        guard let productDetails = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProductDetailsController.self)) as? ProductDetailsController else {return}
        productDetails.proImg = product.productImage2
        productDetails.cate = product.ProductCategory2
        self.navigationController?.pushViewController(productDetails, animated: true)
        
    }
    


    /*
     - estimated size none
     - cell spacing 128 remove
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (self.collectionView.bounds.width / 4) - 10
        //return CGSize(width: (self.collectionView.bounds.width * 0.33) - 10, height: 120)
      //  return CGSize(width: (self.collectionView.bounds.width / 4) - 10, height: 130)
        
        switch indexPath.section{
            case 0:
                return CGSize(width: (self.collectionView.bounds.width * 0.33) - 10, height: 120)
            default:
                return CGSize(width: (self.collectionView.bounds.width * 0.25) - 10, height: 140)
            
        }
    }
}
