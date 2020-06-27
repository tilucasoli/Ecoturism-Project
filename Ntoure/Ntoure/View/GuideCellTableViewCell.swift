//
//  GuideCellTableViewCell.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class GuideCellTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imgService: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .withoutImage
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .titleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var btnArrow: UIButton = {
        let btn = UIButton()
        btn.tintColor = .textColor
        btn.setImage(UIImage(named: "arrow-right"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    func setupCell() {
        selectionStyle = .none
        let const = heightAnchor.constraint(equalToConstant: 57)
        const.priority = UILayoutPriority(999)
        const.isActive = true
    }

    func setupCellCard() {
        addSubview(cellView)

        NSLayoutConstraint.activate([
            cellView.heightAnchor.constraint(equalToConstant: 55),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            cellView.topAnchor.constraint(equalTo: self.topAnchor)
//            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }

    func setupImgService() {
        cellView.addSubview(imgService)

        NSLayoutConstraint.activate([
            imgService.heightAnchor.constraint(equalToConstant: 43),
            imgService.widthAnchor.constraint(equalToConstant: 43),
            imgService.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            imgService.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 6)
        ])

    }

    func setupTitle() {
        cellView.addSubview(title)

        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            title.leftAnchor.constraint(equalTo: imgService.rightAnchor, constant: 18)
        ])
    }

    func setupBtnIcon() {
        cellView.addSubview(btnArrow)

        NSLayoutConstraint.activate([
            btnArrow.rightAnchor.constraint(equalTo: cellView.rightAnchor, constant: -16),
            btnArrow.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            btnArrow.heightAnchor.constraint(equalToConstant: 19),
            btnArrow.widthAnchor.constraint(equalToConstant: 12)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupCellCard()
        setupImgService()
        setupTitle()
        setupBtnIcon()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))

    }
}
