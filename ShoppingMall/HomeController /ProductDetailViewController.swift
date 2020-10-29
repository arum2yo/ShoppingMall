//
//  ProductDetailViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Moya

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var productImagesHeaderView: ProductImageHeaderView!
    
    
    var product : Product! //무조건 데이터가 있어서, 눌러지는거니까 ~~~
    let provider = MoyaProvider<ProductProvider>()
    
    let pageImageViewController : ProductImageViewController? = nil
    
    
    struct Storyboard {
        
        static let productDetailCell = "ProductDetailCell"
        static let buyButtonCell = "BuyButtonCell"
        static let showProductDetailCell = "ShowProductDetailCell"
        static let suggestTableViewCell = "SuggestTableViewCell"
        static let suggestCollectionViewCell = "SuggestCollectionViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title =  product.name
        print("product.id",product.id!)
        
        getData()
        
        pageImageViewController?.images = product.images
        
        
    }
    
    func getData(){
        ProductNetworking.detail(id: product.id!) { (result) in
            self.product = result
            self.tableView.reloadData()
            
        }
    }
    
    @IBAction func backBTNTab(_ sender: Any) {
        
        if let navi = self.navigationController{
            
            navi.popViewController(animated: true)
        }
    }
    
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailTableViewCell
            
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
            
        } else if indexPath.row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonTableViewCell
            
            cell.product = product
            cell.selectionStyle = .none
            
            return cell
            
            
        } else if indexPath.row == 2{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.showProductDetailCell, for: indexPath) as! ShowDetailTableViewCell
            
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 3{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestTableViewCell, for: indexPath) as! SuggestTableViewCell
            
            
            cell.selectionStyle = .none
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            
            return  180
        } else if indexPath.row == 1 {
            
            return  65
            
        } else if indexPath.row == 2 {
            
            return  65
        } else if indexPath.row == 3 {
            
            return tableView.bounds.width + 200
            
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            
            if let cell = cell as? SuggestTableViewCell{
                
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
}

extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.suggestCollectionViewCell, for: indexPath) as! SuggestImageCollectionViewCell
        
//        let products = Product.fetchProducts()
//        cell.image = products[indexPath.item].images?.first
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            
           layout.minimumLineSpacing = 5.0
            layout.minimumLineSpacing = 2.5
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            return CGSize(width: itemWidth, height: itemWidth)
        }
        return CGSize.zero
    }

}


