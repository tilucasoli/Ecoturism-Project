//
//  ModalViewController.swift
//  Ntoure
//
//  Created by Vitor Bryan on 25/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    var guideList = [Guide]()
    var data: Adventure?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let titleModal: UILabel = {
        var title = UILabel()
        title.text = "Adicionar ao Roteiro"
        title.textColor = .titleColor
        title.numberOfLines = 1
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        
        
        self.guideList = PlistManager().read()

        
        setupTableView()
    }
    
}

extension ModalViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(GuideCellTableViewCell.self, forCellReuseIdentifier: "guideCell")

        view.addSubview(tableView)
        view.addSubview(titleModal)

        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: titleModal.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleModal.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            titleModal.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleModal.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "guideCell", for: indexPath) as? GuideCellTableViewCell
        cell?.backgroundColor = .background
        cell?.title.text = guideList[indexPath.row].name
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cv = SelectedGuideViewController()
//        cv.adventureList.append(data!)
    }
}
