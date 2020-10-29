//
//  FeedViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Alamofire
import Moya

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products : [Product] = []
    
     let provider = MoyaProvider<ProductProvider>()
    
    private var selectedProduct : Product?
    
    private let url = "http://localhost:1337/products"
    
    struct Storyboard{
        
        static let feedProductCell = "FeedProductCell"
        static let showProductDetail = "ShowProductDetail"
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = " Product Feed "
        
        
        getData()

    }
    
    func getData(){
        
        ProductNetworking.total { (products) in
            
            self.products = products
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.showProductDetail{
            
            if let productDetailVC = segue.destination as? ProductDetailViewController{
                
                productDetailVC.product = selectedProduct //클릭했을때 selected에 정보가 담겨짐.
            }
        }
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.feedProductCell, for: indexPath) as! FeedProductTableViewCell
        
//        if let products = products{

            let product = products[indexPath.row]
            cell.product = product
//            cell.productImage.image = UIImage(named: product.images.first!)

            cell.selectionStyle = .none

//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: Storyboard.showProductDetail, sender: nil)
        
        

    }


}
