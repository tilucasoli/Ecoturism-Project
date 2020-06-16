//
//  SelectedGuideViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 12/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedGuideViewController: UIViewController {
    let section = ["To do", "Done"]
    
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
        
        tableView.register(GuideCellTableViewCell.self, forCellReuseIdentifier: "guideCell")
        
        setupEmptyState()
        view.addSubview(tableView)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "guideCell", for: indexPath) as? GuideCellTableViewCell)!
        
        return cell
    }
    
}
