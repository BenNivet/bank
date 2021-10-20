//
//  BankViewController.swift
//  bank
//
//  Created by Benjamin Cante on 18/10/2021.
//

import UIKit

protocol Loadable {
    func showLoader()
    func hideLoader()
}

class BankViewController: UIViewController {
    
    private lazy var activityView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            loader.style = .medium
        }
        loader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        loader.hidesWhenStopped = true
        loader.color = Constants.mainColor
        loader.center = view.center
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        view.addSubview(activityView)
    }
    
    func showActivityIndicator() {
        activityView.startAnimating()
    }
    
    func hideActivityIndicator(){
        activityView.stopAnimating()
    }
}

extension UIViewController: Loadable {
    
    func showLoader() {
        guard let vc = self as? BankViewController else {
            return
        }
        vc.view.isUserInteractionEnabled = false
        vc.showActivityIndicator()
    }
    
    func hideLoader() {
        guard let vc = self as? BankViewController else {
            return
        }
        vc.view.isUserInteractionEnabled = true
        vc.hideActivityIndicator()
    }
    
}
