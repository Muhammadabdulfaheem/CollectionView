//
//  HomeController.swift
//  OsamaCollection1
//
//  Created by MAC on 09/06/2021.
//

import UIKit

class HomeController: UIViewController, UISearchBarDelegate{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var categories: [String] = ["Categories","Featured","Mens","Womens"]
    var filterData: [String]? = nil
    
    
    var categoriesProducts1 = [
        //THIS IS THE FIRST ARRAY THAT APPEAR ON THE TOP OF COLLECTION VIEW INSIDE TABLEVIEW
            Product2(productImage2: "DiceFour", ProductCategory2: "Shopify"),
            Product2(productImage2: "DiceFive", ProductCategory2: "Wordpress"),
            Product2(productImage2: "DiceOne", ProductCategory2: "Elementor"),
            Product2(productImage2: "DiceOne", ProductCategory2: "Elementor"),
            Product2(productImage2: "DiceOne", ProductCategory2: "Elementor")
    ]
    
 
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchBar.delegate = self
        filterData = categories
        // Search Bar options
        searchBar.placeholder = "Search by Title, Author or Series"
        
        // Add a colour border for the search bar
        searchBar.tintColor = UIColor.orange
        self.tableView.register(UINib(nibName: String(describing: ProductCell3.self), bundle: .main), forCellReuseIdentifier: String(describing: ProductCell3.self))
    }
    
}


extension HomeController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductCell3.self), for: indexPath) as? ProductCell3 else {return UITableViewCell()}
        
        cell.row = indexPath.row //passing the index number
        
        //cell.btnDelegate = self
        //cell.btnSeeAll.tag = indexPath.row //for sell all button 1st method
        //rcell.btnSeeAll.setTitle("\(indexPath.row)", for: .normal)
        
        cell.btnSeeAll.tag = indexPath.row
        cell.btnSeeAll.addTarget(self, action: #selector(btnCellTapped(sender:)), for: .touchUpInside)//when button press this call
        //cell.products2 = categoriesProducts1[indexPath.row]
        cell.products = categoryProducts[indexPath.row]
        cell.header = self.categories[indexPath.row]
        return cell
    }
    
    @objc
    func btnCellTapped(sender: UIButton){
     //for button click it called this function
        
        print(sender.tag)
        
        guard let aboutControllerView = self.storyboard?.instantiateViewController(identifier: String(describing:AboutController.self)) as? AboutController else {return}
        
            
        self.navigationController?.pushViewController(aboutControllerView, animated: true)

    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  indexPath.row == 0 ? 150 : 190 //giving the height to parent element tableview
    }
    
    //FOR SEARCHNING BAR FUNCTIONALITY
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        //filterData = []
        
        if searchText == "" {
            filterData = categories
            /*if you remove the data in searh bar then it repopulate the data means it load
             the previous data same**/
        }
        else{
        for category in categories{
            if category.lowercased().contains(searchText.lowercased()){
                filterData?.append(category)
            }
        }
        }
        self.tableView.reloadData()
    }
    
}

