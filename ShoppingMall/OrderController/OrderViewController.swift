//
//  OrderViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/24.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya

class OrderViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var provider = MoyaProvider<OrderProvider>()
    
    var orders: [Order]?
    
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
       getData()
    }

    func getData(){
        
        OrderNetworking.total { (results) in
            print("orderRe",results)
            
//            self.orders = results
            
        }
    }
}


extension OrderViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let orders = orders {

            return orders.count + 4
        } else {
            return 1
        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let orders = orders else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemTableViewCell


            cell.numOfLabel.text = " 0 ITEM "

            return cell
        }

        if indexPath.row == 0 {

            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.numberOfItemsCell, for: indexPath) as! NumberOfItemTableViewCell

            cell.numOfLabel.text = (orders.count == 1) ? " \(orders.count) ITEM " : " \(orders.count) ITEMS "

            return cell
        } else if indexPath.row == orders.count + 1 {

            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cartDetailCell, for: indexPath)

            return cell


        } else if indexPath.row == orders.count + 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.totalCell, for: indexPath)

            return cell

        } else if indexPath.row == orders.count + 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.checkOutButtonCell, for: indexPath)

            return cell
        } else {

            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.itemCell, for: indexPath) as! ShoppingCartItemTableViewCell

            cell.order = orders[indexPath.row - 1] //0.1.2.3.4
            return cell


        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard let orders = orders else { return 0}

        if indexPath.row == 0 {
            return 70
        } else  if indexPath.row == orders.count + 1 {
            return 125
        }else  if indexPath.row == orders.count + 2 {
            return 75
        }else  if indexPath.row == orders.count + 3 {
            return 65
        }else {
            return 145
        }
        
        return 0
    }
    
    
}
