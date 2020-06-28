//
//  SelectedGuideViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 12/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedGuideViewController: UIViewController {
    let sections = ["Quero fazer", "Feito"]
    
    var listGuide = [Guide]()
    
    var adventureList = [Adventure]()
    var doneAdventure = [Adventure]()
    var notDoneAdventure = [Adventure]()
    
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
        
        adventureList = listGuide[indexPathSelected].adventures
        doneAdventure = adventureList.filter {$0.status == true}
        notDoneAdventure = adventureList.filter {$0.status == false}
        
        setupEmptyState()
//        hiddenTableView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hiddenTableView()
        adventureList = PlistManager().read()[indexPathSelected].adventures
        tableView.reloadData()
    }
    
    func hiddenTableView() {
        if adventureList.isEmpty {
            tableView.isHidden = true
        }
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
        if section == 0 {
            let num = self.notDoneAdventure.count
            return num
        } else {
            let num = self.doneAdventure.count
            return num
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                if indexPath.section == 0 {
                    self.notDoneAdventure.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                } else {
                    self.doneAdventure.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                }
                listGuide[indexPathSelected].adventures = notDoneAdventure + doneAdventure
                PlistManager().write(guide: self.listGuide)
                adventureList = PlistManager().read()[indexPathSelected].adventures
                self.hiddenTableView()
            }
            
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = (tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as? MyCustomHeader)!
        view.titleLbl.text = sections[section]
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "AdventureCell", for: indexPath) as? AdventureTableViewCell)!
       
        cell.backgroundColor = .background
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.set(adventure: self.notDoneAdventure[indexPath.row])
        } else {
            cell.set(adventure: self.doneAdventure[indexPath.row])
            cell.subviews.forEach {$0.alpha = 0.7}
            cell.adventureTitleLabel.attributedText = addStrikethrough(string: doneAdventure[indexPath.row].activityName)
        }
        
        return cell
    }
    func addStrikethrough(string: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: string)
        let range = NSMakeRange(0, attributeString.length)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
        return attributeString
    }
    
}
