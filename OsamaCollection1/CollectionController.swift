//
//  CollectionController.swift
//  OsamaCollection1
//
//  Created by MAC on 13/06/2021.
//

import UIKit

class CollectionController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        //self.tableView.register(UINib(nibName: String(describing: ProductCell4.self), bundle: .main), forCellReuseIdentifier: String(describing: ProductCell4.self))

        // Do any additional setup after loading the view.
    }
    
}

/*
extension CollectionController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
*/

