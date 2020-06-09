//
//  AdventureViewController.swift
//  Ntoure
//
//  Created by Larissa Uchoa on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class AdventureViewController: UIViewController {

    var tableView = UITableView()
    var adventures: [Adventure] = []
    
    struct Cells {
        static let adventureCell = "AdventureCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        adventures = fetchData()
        
        title = "Aventuras"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        
        tableView.rowHeight = 64
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(AdventureTableViewCell.self, forCellReuseIdentifier: Cells.adventureCell)
    }
    
    func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension AdventureViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(integerLiteral: 20)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Ceará, Canoa Quebrada"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.adventureCell) as! AdventureTableViewCell
        let adventure = adventures[indexPath.row]
        cell.set(adventure: adventure)
        
        return cell
    }
    
    
}

extension AdventureViewController {
    
    func fetchData() -> [Adventure] {
        let adventure1 = Adventure(image: UIImage(named: "Adventure")!, title: "Trilha por Canoa Quebrada")
        let adventure2 = Adventure(image: UIImage(named: "Adventure")!, title: "Bondinho em Canoa Quebrada")
        let adventure3 = Adventure(image: UIImage(named: "Adventure")!, title: "Surf em Canoa Quebrada")
        
        return [adventure1, adventure2, adventure3]
    }
}
