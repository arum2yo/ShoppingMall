//
//  ProductImagesPageViewController.swift
//  ShoppingMall
//
//  Created by Ahreum CHO on 2020/09/17.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

protocol ProductImagesPageViewControllerDelegate: class {
    func setupPageController(numberOfPage: Int)
    func turnPageController(to index: Int)
}

class ProductImagesPageViewController: UIPageViewController {
    
    var images: [UIImage]? = Product.fetchProducts().first!.images
    weak var pageviewControllerDelegate: ProductImagesPageViewControllerDelegate?
    
    
    struct Storyboard {
        static let productImageView = "ProductImageView"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       automaticallyAdjustsScrollViewInsets = false //곧 단종될 예정
        dataSource = self
        delegate = self
        
        self.turnToPage(index: 0)
    }
  
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        var controllers = [UIViewController]()
        
        if let images = self.images{
            
            for image in images{
                
                let productImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.productImageView)
                
                controllers.append(productImageVC)
            }
            
        }
        self.pageviewControllerDelegate?.setupPageController(numberOfPage: controllers.count)
        
        return controllers
        
    }()
    
    func turnToPage(index: Int){
        
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
            
            let currentIndex = controllers.firstIndex(of: currentVC)
            if currentIndex! > index {
                
                direction = .reverse
            }
        }
        
        self.configDisplaying(viewcontroller: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configDisplaying(viewcontroller: UIViewController){
        
        for (index, vc) in controllers.enumerated(){
            
            if viewcontroller === vc {
                
                if let productImageVC  = viewcontroller as? ProductImageViewController{
                    
                    productImageVC.image = self.images?[index]
                    self.pageviewControllerDelegate?.turnPageController(to: index)
                }
            }
        }
    }
    
}


// MARK: - UIPageViewControllerDataSource

extension ProductImagesPageViewController : UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}

extension ProductImagesPageViewController : UIPageViewControllerDelegate
{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController])
    {
        self.configDisplaying(viewcontroller: pendingViewControllers.first as! ProductImageViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if !completed {
            self.configDisplaying(viewcontroller: previousViewControllers.first as! ProductImageViewController)
        }
    }
}
