//
//  CheckOutViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/24.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    struct Storyboard {
        static let billingTitleCell = "BillingTitleCell"
        
        static let billingEmail = "BillingEmail"
        static let billingCardNumber = "BillingCardNumber"
        static let billingCardExpire = "BillingCardExpire"
        static let billingCardCVC = "BillingCardCVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension CheckOutViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingTitleCell, for: indexPath)
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingEmail, for: indexPath)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingCardNumber, for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingCardExpire, for: indexPath)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.billingCardCVC, for: indexPath)
            return cell
   
        default:
            return UITableViewCell()
        }
       
    }
    
    
}
