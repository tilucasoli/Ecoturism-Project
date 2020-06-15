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
    
    let illustration: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "guide illustration")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let illustrationTitleLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Você não tem Aventuras?", attributes: illustrationTitle)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let illustrationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tente explorar a sessão de Aventuras, você vai se apaixonar"
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavBar()
        setupIllustration()
        setupIllustrationTitleLabel()
        setupIllustrationDescriptionLabel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        
        if !guideList.isEmpty {
            setupTableView()
        }
    }

    func setupNavBar() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleStyle
        title = "Roteiros"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(creatingGuide))
        navigationController?.navigationBar.tintColor = .actionColor
    }
    
    @objc func creatingGuide() {
        let newVC = SelectedGuideViewController()
        let newGuide = Guide(name: "New Guide")
        guideList.append(newGuide)

        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    func setupIllustration() {
        view.addSubview(illustration)
        
        illustration.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            illustration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            illustration.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 115)
        ])
    }
    
    func setupIllustrationTitleLabel() {
        view.addSubview(illustrationTitleLabel)
        
        NSLayoutConstraint.activate([
            illustrationTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            illustrationTitleLabel.topAnchor.constraint(equalTo: illustration.bottomAnchor, constant: 16)
        ])
    }
    
    func setupIllustrationDescriptionLabel() {
        view.addSubview(illustrationDescriptionLabel)
        
        NSLayoutConstraint.activate([
            illustrationDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            illustrationDescriptionLabel.topAnchor.constraint(equalTo: illustrationTitleLabel.bottomAnchor, constant: 4),
            illustrationDescriptionLabel.widthAnchor.constraint(equalToConstant: 284)
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
}
