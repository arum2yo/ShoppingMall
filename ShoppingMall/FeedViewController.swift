//
//  FeedViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products:[Product]?
    
    struct Storyboard{
        
        static let feedProductCell = "FeedProductCell"
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = " Product Feed "
        
        fetchProducts()
        
//        tableView.estimatedRowHeight = 480
        
//        tableView.rowHeight = UITableView.automaticDimension
        
        

    }
    
    func fetchProducts(){
        
        products = Product.fetchProducts()
        
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let products = products{
            
            return products.count //최대한 옵셔널 사용 제하려고~
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //FeedProductCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.feedProductCell, for: indexPath) as! FeedProductTableViewCell
        
        cell.productImage.image = products![indexPath.row].images?.first
        cell.productName.text = products![indexPath.row].name
        cell.productPrice.text = "$ \(products![indexPath.row].price ?? 0)"
        
        
        return cell
    }
}
