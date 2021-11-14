//
//  AboutController.swift
//  OsamaCollection1
//
//  Created by MAC on 09/06/2021.
//

import UIKit

class AboutController: UIViewController {

    var categoires: [String] = ["Mens","Womens","Watch","Shoes"]
    
       var categoryProducts = [
       
           [
           Product(productImage:"DiceOne", price: "Ahmed", category: "Men"),
           Product(productImage:"DiceTwo", price: "Raza", category: "Men"),
           Product(productImage:"DiceThree", price: "$ 100", category: "Men"),
           Product(productImage:"DiceFour", price: "$ 100", category: "Men")
           ],
           [
           Product(productImage:"DiceOne", price: "Ahmed", category: "Men"),
           Product(productImage:"DiceTwo", price: "Raza", category: "Men"),
           Product(productImage:"DiceThree", price: "$ 100", category: "Men"),
           Product(productImage:"DiceFour", price: "$ 100", category: "Men")
           ],
           [
           Product(productImage:"DiceOne", price: "Tando", category: "Men"),
           Product(productImage:"DiceTwo", price: "Adam", category: "Men"),
           Product(productImage:"DiceThree", price: "$ 100", category: "Men"),
           Product(productImage:"DiceFour", price: "$ 100", category: "Men")
           ],
           [
           Product(productImage:"DiceOne", price: "Ammi", category: "Men"),
           Product(productImage:"DiceTwo", price: "Pappa", category: "Men"),
           Product(productImage:"DiceThree", price: "$ 100", category: "Men"),
           Product(productImage:"DiceFour", price: "$ 100", category: "Men")
           ]
       ]
       

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: String(describing: ProductCell4.self), bundle: .main), forCellReuseIdentifier: String(describing: ProductCell4.self))
    }
    
}

extension AboutController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoires.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell4.self), for: indexPath) as? ProductCell4 else {return UITableViewCell()}
        cell.row = indexPath.row //
        cell.header = categoires[indexPath.row]
        cell.productsData = categoryProducts[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400

    }
    
    
}
