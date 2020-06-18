//
//  SelectedGuideViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 12/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedGuideViewController: UIViewController {
    let sections = ["To do", "Done"]
    
    var listGuide = [Guide]()
    var indexPathSelected = 0
    
    let emptyState: EmptyState = {
        let emptyState = EmptyState()
        emptyState.illustration.image = UIImage(named: "Adventure Illustration")
        emptyState.illustrationTitleLabel.text = "Você não tem Aventuras?"
        emptyState.illustrationDescriptionLabel.text = "Tente explorar a sessão de Aventuras, você vai se apaixonar"
        emptyState.translatesAutoresizingMaskIntoConstraints = false
        return emptyState
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.background.cgColor
        title = listGuide[indexPathSelected].name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTitle))
        
        setupEmptyState()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    @objc func editTitle() {
        let alertController = UIAlertController(title: "Editando Roteiro", message: "Altere o título do Roteiro", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: {(textField) in
            textField.placeholder = "Tente Roteiro para Jericoacoara"
        })
        alertController.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: {_ in}))
        alertController.addAction(UIAlertAction(title: "Alterar", style: .default, handler: {_ in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                self.title = text
                self.listGuide[self.indexPathSelected].name = text
            }
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupEmptyState() {
        view.addSubview(emptyState)
        
        NSLayoutConstraint.activate([
            emptyState.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emptyState.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

extension SelectedGuideViewController: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.register(AdventureTableViewCell.self, forCellReuseIdentifier: "AdventureCell")
        tableView.register(MyCustomHeader.self, forHeaderFooterViewReuseIdentifier: "HeaderCell")

        tableView.rowHeight = 72
        tableView.sectionHeaderHeight = 40
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = (tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? MyCustomHeader)!
        view.titleLbl.text = sections[section]
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "AdventureCell", for: indexPath) as? AdventureTableViewCell)!
        
        let listAdventures = fetchData()
        cell.set(adventure: listAdventures[indexPath.row])
        cell.backgroundColor = .background
        cell.selectionStyle = .none
        print(indexPath.section)
        return cell
    }
    
}

extension SelectedGuideViewController {
    
    func fetchData() -> [Adventure] {
        let adventure1 = Adventure(image: UIImage(named: "parapenteImg")!, title: "Aventura de Parapente", categoria: "Parapente", distancia: "5km")
        let adventure2 = Adventure(image: UIImage(named: "jangadaImg")!, title: "Travessia de Jangada", categoria: "Jangada", distancia: "7km")
        let adventure3 = Adventure(image: UIImage(named: "kitesurfImg")!, title: "Praia de KiteSurfing", categoria: "Kitesurf", distancia: "11km")
        
        return [adventure1, adventure2, adventure3]
    }
}
