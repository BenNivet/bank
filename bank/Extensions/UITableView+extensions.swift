//
//  UITableView+extensions.swift
//  bank
//
//  Created by Benjamin Cante on 19/10/2021.
//

import UIKit

extension UITableView {
    
    func setBackgroundView(text: String, textColor: UIColor? = .lightGray) {
        let emptyView = UIView(frame: bounds)
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = textColor
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.textAlignment = .center
        emptyView.addSubview(titleLabel)
        titleLabel.text = text
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true        
        backgroundView = emptyView
    }

    func removeBackgroundView() {
        backgroundView = nil
    }
    
}
