//
//  tableViewAlert.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class tableViewAlert: UIView {
    
    var data: Adventure?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension tableViewAlert: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlistManager().read().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guideCell", for: indexPath) as? GuideCellTableViewCell
        let guideList = PlistManager().read()
        
        cell?.backgroundColor = #colorLiteral(red: 0.937048316, green: 0.9412510991, blue: 0.9411101937, alpha: 1)
        cell?.title.text = guideList[indexPath.row].name
        
        if let image = guideList[indexPath.row].getImage() {
            cell?.imgService.image = image
        } else {
            cell?.imgService.backgroundColor = .withoutImage
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentList = PlistManager().read()
        guard let data = data else {return}
        currentList[indexPath.row].adventures.append(data)
        PlistManager().write(guide: currentList)
        
    }
    
    func setupTableView() {
        self.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(GuideCellTableViewCell.self, forCellReuseIdentifier: "guideCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
    }
    
}
