//
//  MyCustomHeader.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 17/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class MyCustomHeader: UITableViewHeaderFooterView {

    let titleLbl: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .titleColor
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .background
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .background
        
        setupTitle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitle() {
        contentView.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            titleLbl.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
}
