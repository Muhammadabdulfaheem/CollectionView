//
//  TestViewController.swift
//  OsamaCollection1
//
//  Created by MAC on 13/11/2021.
//

import UIKit

class TestViewController: UIViewController {

    var categories: [String] = ["Jeans","Shoes"]
    @IBOutlet weak var tableView:UITableView!
    
    var products : [Product] = [
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: TestCell.self), bundle: .main), forCellReuseIdentifier: String(describing: TestCell.self))
    }
    
}


extension TestViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configureTestCell(tableView, cellForRowAt: indexPath)
    }
    
    
    func configureTestCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let testCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TestCell.self)) as? TestCell else {return UITableViewCell()}
        testCell.categoriesData = self.categories[indexPath.row]
        testCell.faheem = self.products
        testCell.products = self.products2
        testCell.row = indexPath.row
        testCell.sellAll.tag = indexPath.row
        testCell.sellAll.addTarget(self, action: #selector(gotoCategories(sender:)), for: .touchUpInside)
        return testCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 300: 380
    }
    
    @objc func gotoCategories(sender:UIButton){
        guard let sellAll = self.storyboard?.instantiateViewController(withIdentifier: String(describing: SellAllViewController.self)) as? SellAllViewController else {return}
        sellAll.btn = sender.tag
        print("getting index\(sellAll.btn)")
        sellAll.faheem = self.products
        sellAll.products = self.products2
        self.navigationController?.pushViewController(sellAll, animated: true)
    }
}
