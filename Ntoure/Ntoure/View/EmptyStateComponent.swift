//
//  EmptyStateComponent.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 15/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class EmptyState: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupIllustration()
        setupIllustrationTitleLabel()
        setupIllustrationDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let illustration: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let illustrationTitleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "You don't add a photo", attributes: illustrationTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let illustrationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupIllustration() {
        addSubview(illustration)
        
        illustration.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            illustration.topAnchor.constraint(equalTo: self.topAnchor),
            illustration.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupIllustrationTitleLabel() {
        addSubview(illustrationTitleLabel)
        
        NSLayoutConstraint.activate([
            illustrationTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            illustrationTitleLabel.topAnchor.constraint(equalTo: illustration.bottomAnchor, constant: 16)
        ])
    }
    
    func setupIllustrationDescriptionLabel() {
        addSubview(illustrationDescriptionLabel)
        
        NSLayoutConstraint.activate([
            illustrationDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            illustrationDescriptionLabel.topAnchor.constraint(equalTo: illustrationTitleLabel.bottomAnchor, constant: 4),
            illustrationDescriptionLabel.widthAnchor.constraint(equalToConstant: 284)
        ])
    }
    
}
