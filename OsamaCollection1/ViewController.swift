//
//  ViewController.swift
//  OsamaCollection1
//
//  Created by MAC on 08/06/2021.
//

import UIKit

class ViewController: UIViewController{

    var products : [Product] = [
    Product(productImage: "DiceOne", price: "$ 1000", category: "Woman T-shirt"),
    Product(productImage: "DiceTwo", price: "$ 2000", category: "Woman Watch"),
    Product(productImage: "DiceThree", price: "$ 300", category: "Mens T-shirt"),
    Product(productImage: "DiceThree", price: "$ 300", category: "Mens T-shirt"),
    Product(productImage: "DiceThree", price: "$ 300", category: "Mens T-shirt"),
    ]
    
    var products2 : [Product2] = [
    Product2(productImage2: "DiceOne", ProductCategory2: "Men"),
    Product2(productImage2: "DiceTwo", ProductCategory2: "Women"),
    Product2(productImage2: "DiceThree", ProductCategory2: "Watch"),
    Product2(productImage2: "DiceFour", ProductCategory2: "Jeans")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: String(describing: ProductCell.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCell.self))
        self.collectionView.register(UINib(nibName: String(describing: ProductCell2.self), bundle: .main), forCellWithReuseIdentifier: String(describing: ProductCell2.self))
    }

    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        /*
        if section == 2{
            return 2
        }
        return 0
         */
        return products.count
    }
    
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell
            cell?.product = self.products[indexPath.row]
            return cell!
        
        /*
        if indexPath.section == 0{
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell.self), for: indexPath) as? ProductCell
            cell?.product = self.products[indexPath.row]
            return cell!
        }
        else {
            
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductCell2.self), for: indexPath) as? ProductCell2
            cell1?.products2 = self.products2[indexPath.row]
            return cell1!
        }
 */
        
    }
  
  /*
    func gotoProductDetails(product: Product){
        guard let productDetails1 = self.storyboard? .instantiateViewController(identifier: String(describing: ProductDetailsController1.self)) as?
                ProductDetailsController1 else {return}
        productDetails1.productImage = products.prouctImage
    }
    
 */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //self.goProductDetails(product: self.products[indexPath.row])
    
        guard let productDetails1 = self.storyboard? .instantiateViewController(identifier: String(describing: ProductDetailsController1.self)) as? ProductDetailsController1 else{return}
        
        productDetails1.productImage = products[indexPath.row].productImage
        productDetails1.productPrice = products[indexPath.row].price
        
        self.navigationController?.pushViewController(productDetails1, animated: true)
        print("GUARD STATEMENT")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let width = (self.collectionView.bounds.width / 4) - 5
        return CGSize(width: width, height: 150)
 
       // return CGSize(width: 120, height:120)
    }
    
    
    
    
}
extension UIView{
    
   func displayCell(){
    self.layer.cornerRadius = 10
    self.layer.borderWidth = 2.0
    self.layer.masksToBounds = true
    }
}
