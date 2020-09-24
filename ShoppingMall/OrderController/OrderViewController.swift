//
//  OrderViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/24.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product]?
    
    struct Storyboard {
        static let numberOfItemsCell = "NumberOfItemsCell"
        static let itemCell = "ItemCell"
        static let cartDetailCell = "CartDetailCell"
        static let totalCell = "TotalCell"
        static let checkOutButtonCell = "CheckOutButtonCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.rowHeight = UITableView.automaticDimension
        fetchProducts()
    }

    func fetchProducts(){
        
        products = Product.fetchProducts()
        tableView.reloadData()
        
    }

}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let products = products {
            
            return products.count + 4
        } else {
            return 1
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let products = products else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemTableViewCell
            
            
            cell.numOfLabel.text = " 0 ITEM "
            
            return cell
        }
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemTableViewCell
            
            cell.numOfLabel.text = (products.count == 1) ? " \(products.count) ITEM " : " \(products.count) ITEMS "
            
            return cell
        } else if indexPath.row == products.count + 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath) 
            
            return cell
            
            
        } else if indexPath.row == products.count + 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCell, for: indexPath)
            
            return cell
            
        } else if indexPath.row == products.count + 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkOutButtonCell, for: indexPath)
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.itemCell, for: indexPath) as! ShoppingCartItemTableViewCell
            
            cell.product = products[indexPath.row - 1] //0.1.2.3.4
            return cell
            
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let products = products else { return 0}
        
        if indexPath.row == 0 {
            return 70
        } else  if indexPath.row == products.count + 1 {
            return 125
        }else  if indexPath.row == products.count + 2 {
            return 75
        }else  if indexPath.row == products.count + 3 {
            return 65
        }else {
            return 145
        }
        
        return 0
    }
    
    
}
