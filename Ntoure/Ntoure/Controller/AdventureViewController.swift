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
        
        tableView.separatorStyle = .none
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 16, y: 8, width: 200, height: 20))
        let locationIcon = UIImageView(frame: CGRect(x: 20, y: 11, width: 9, height: 14))
        let labelLocation = UILabel(frame: CGRect(x: 24 + locationIcon.frame.width, y: 8, width: 200, height: 20))
        
        view.backgroundColor = .white
        
        labelLocation.text = "Ceará, Canoa Quebrada"
        labelLocation.textColor = .black
        labelLocation.font = UIFont(name: "SFProText", size: 16)
        labelLocation.font.withSize(16)
        
        locationIcon.image = UIImage(named: "Location")
        
        view.addSubview(locationIcon)
        view.addSubview(labelLocation)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.adventureCell) as! AdventureTableViewCell
        let adventure = adventures[indexPath.row]
        cell.set(adventure: adventure)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AdventureTableViewCell
        print(cell.adventureTitleLabel.text)
    }
    
}

extension AdventureViewController {
    
    func fetchData() -> [Adventure] {
        let adventure1 = Adventure(image: UIImage(named: "Adventure")!, title: "Trilha por Canoa Quebrada", categoria: "Trilha", distancia: "50km")
        let adventure2 = Adventure(image: UIImage(named: "Adventure")!, title: "Tirolesa em Canoa Quebrada", categoria: "Tirolesa", distancia: "57km")
        let adventure3 = Adventure(image: UIImage(named: "Adventure")!, title: "Surf em Canoa Quebrada", categoria: "Surf", distancia: "44km")
        
        return [adventure1, adventure2, adventure3]
    }
}