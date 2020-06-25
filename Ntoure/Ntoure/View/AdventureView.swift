//
//  AdventureView.swift
//  Ntoure
//
//  Created by Anderson Alencar on 11/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class AdventureView: UIView {
    
    weak var delegate: MyDelegate?

    var guideList: [Adventure] = [] {
        didSet {
            self.adventureServices.reloadData()
        }
    }

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
        showAll.setTitle("Ver Todos", for: .normal)
        showAll.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        showAll.setTitleColor(.actionColor, for: .normal)
        showAll.addTarget(self, action: #selector(pushAllAdventures), for: .touchUpInside)
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
        adventureServices.register(AdventureTableViewCell.self, forCellReuseIdentifier: "adventureServiceCell")
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
    
    @objc func pushAllAdventures() {
        self.delegate?.onButtonTapped()
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
            showAllAdventures.centerYAnchor.constraint(equalTo: title.centerYAnchor)
//            showAllAdventures.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
        ])

        NSLayoutConstraint.activate([
            adventureServices.topAnchor.constraint(equalTo: showAllAdventures.bottomAnchor, constant: -5),
            adventureServices.leadingAnchor.constraint(equalTo: leadingAnchor),
            adventureServices.trailingAnchor.constraint(equalTo: trailingAnchor),
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "adventureServiceCell", for: indexPath) as? AdventureTableViewCell
        cell?.backgroundColor = .background
        let adventure = guideList[indexPath.row]
        cell?.set(adventure: adventure)
        cell?.selectionStyle = .none
    
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 8))
        view.backgroundColor = .background
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //pass cell id here to the next controller
        var data = guideList[indexPath.row]
        func pushAdventure() {
            self.delegate?.adventureTapped(data: data)
        }
        pushAdventure()
       
    }
    
}

//extension AdventureView {
//    
//    func fetchData() -> [Adventure] {
//        let adventure1 = Adventure(image: UIImage(named: "parapenteImg")!, title: "Aventura de Parapente", categoria: "Parapente", distancia: "5km", done: false)
//        let adventure2 = Adventure(image: UIImage(named: "jangadaImg")!, title: "Travessia de Jangada", categoria: "Jangada", distancia: "7km", done: true)
//        let adventure3 = Adventure(image: UIImage(named: "kitesurfImg")!, title: "Praia de KiteSurfing", categoria: "Kitesurf", distancia: "11km", done: false)
//        return [adventure1, adventure2, adventure3]
//    }
//}
