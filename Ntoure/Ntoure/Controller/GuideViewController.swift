//
//  GuideViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 08/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

// Main
class GuideViewController: UIViewController {

    var guideList = [Guide]()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let emptyState: EmptyState = {
        let emptyState = EmptyState()
        emptyState.illustration.image = UIImage(named: "guide illustration")
        emptyState.illustrationTitleLabel.text = "Você não tem Aventuras?"
        emptyState.illustrationDescriptionLabel.text = "Tente explorar a sessão de Aventuras, você vai se apaixonar"
        emptyState.translatesAutoresizingMaskIntoConstraints = false
        return emptyState
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavBar()
        setupEmptyState()
        setupTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        if guideList.isEmpty {
            tableView.isHidden = true
        }
    }

    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleStyle
        title = "Roteiros"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(alertCreatingGuide))
        navigationController?.navigationBar.tintColor = .actionColor
    }
    
    @objc func alertCreatingGuide() {
        let alert = UIAlertController(title: "Criando Roteiro", message: "Adicione um nome para o Roteiro", preferredStyle: .alert)
        
        alert.addTextField {(textField) in
            textField.placeholder = "Tente Roteiro para Jericoacoara"
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: { _ in}))
        alert.addAction(UIAlertAction(title: "Criar", style: .default, handler: {_ in
            if let txtField = alert.textFields?.first, let text = txtField.text {
                let newGuide = Guide(name: text)
                self.guideList.append(newGuide)
                
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupEmptyState() {
        view.addSubview(emptyState)
        
        NSLayoutConstraint.activate([
            emptyState.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            emptyState.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

// TableView Settings
extension GuideViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(GuideCellTableViewCell.self, forCellReuseIdentifier: "guideCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
        let newVC = SelectedGuideViewController()
        newVC.listGuide = self.guideList
        newVC.indexPathSelected = indexPath.row
        self.navigationController?.pushViewController(newVC, animated: true)
    }
}
