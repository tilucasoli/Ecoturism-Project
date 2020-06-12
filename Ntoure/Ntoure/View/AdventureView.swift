//
//  AdventureView.swift
//  Ntoure
//
//  Created by Anderson Alencar on 11/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class AdventureView: UIView {
    
    // Temporary mockData
    var guideList = [Guide(name: "Passei de Barco"), Guide(name: "Trilha de Bicicleta")]

    lazy var title: UILabel = {
        let title = UILabel()
        title.text = "Aventuras"
        title.numberOfLines = 1
        title.textColor = .titleColor
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var showAllAdventures: UIButton = {
        let showAll = UIButton()
        showAll.setTitle("Show All", for: .normal)
        showAll.setTitleColor(.actionColor, for: .normal)
        showAll.translatesAutoresizingMaskIntoConstraints = false
        return showAll
    }()
    
    lazy var adventureServices: UITableView = {
        let adventureServices = UITableView()
        adventureServices.backgroundColor = .background
        adventureServices.separatorStyle = .none
        adventureServices.bounces = false
        adventureServices.delegate = self
        adventureServices.dataSource = self
        adventureServices.register(GuideCellTableViewCell.self, forCellReuseIdentifier: "adventureServiceCell")
        adventureServices.translatesAutoresizingMaskIntoConstraints = false
        return adventureServices
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AdventureView: ViewCode {
    func buildHierarchy() {
        addSubview(title)
        addSubview(showAllAdventures)
        addSubview(adventureServices)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: showAllAdventures.leadingAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            showAllAdventures.topAnchor.constraint(equalTo: topAnchor),
            showAllAdventures.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showAllAdventures.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1)
        ])

        NSLayoutConstraint.activate([
            adventureServices.topAnchor.constraint(equalTo: title.topAnchor, constant: 5),
            adventureServices.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            adventureServices.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            adventureServices.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func aditionalConfigurations() {
        backgroundColor = .background
    }
}

extension AdventureView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adventureServiceCell", for: indexPath) as? GuideCellTableViewCell
        cell?.backgroundColor = .background
        cell?.title.text = guideList[indexPath.row].name
        return cell ?? UITableViewCell()
    }
}
