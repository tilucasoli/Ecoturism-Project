//
//  ExplorerViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 08/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit


class ExplorerViewController: UIViewController {
    
    //places example
    let data = [
        CustomData(title: "Canoa Quebrada", distance: "136 Km", image: #imageLiteral(resourceName: "canoa")),
        CustomData(title: "Parque do Cocó", distance: "13 Km", image: #imageLiteral(resourceName: "Parque") )
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 10, height: 600)
        layout.sideItemScale = 0.8
        layout.sideItemAlpha = 1.0
        layout.spacingMode = .fixed(spacing: 20)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCellViewController.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    fileprivate let location: UILabel = {
       let text = UILabel()
        text.text = "Ceará, Brasil"
        text.textColor = .titleColor
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .left
        text.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return text
    }()
    
    fileprivate let searchBar: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.placeholder = "Tente Canoa Quebrada"
        searchController.searchBar.searchBarStyle = .prominent
        searchController.searchBar.isTranslucent = true
        searchController.definesPresentationContext = true
        
        let textField = searchController.searchBar.searchTextField
        textField.backgroundColor = .white

//
//        if let textfield = searchController.value(forKey: "searchField") as? UITextField {
//            textfield.textColor = UIColor.blue
//            if let backgroundview = textfield.subviews.first {
//                // Background color
//                backgroundview.backgroundColor = UIColor.white
//                // Rounded corner
//                backgroundview.layer.cornerRadius = 14;
//                backgroundview.clipsToBounds = true;
//            }
//        }
//        searchController.searchBar.backgroundColor = .black
        return searchController
    }()
    
    let searchBarView: UIView = {
        let sbView = UIView()
        return sbView
    }()
    
    
    fileprivate let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
      
        return topView
    }()
    
    fileprivate let botView: UIView = {
        let botView = UIView()
        botView.translatesAutoresizingMaskIntoConstraints = false
        
        return botView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explorar"
        navigationController?.navigationBar.tintColor = .actionColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleStyle
        navigationItem.searchController = searchBar //SearchController here
//        view.addSubview(searchBar)
        view.addSubview(UIView())
        
        view.backgroundColor = .background
        view.addSubview(collectionView)
        view.addSubview(topView)
        view.addSubview(botView)
        view.addSubview(location)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23).isActive = true
        
        botView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        botView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        botView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        botView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        collectionView.backgroundColor = .background
        collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: botView.topAnchor).isActive = true
        
        location.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 21).isActive = true
        location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ExplorerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.2, height: collectionView.frame.height/1.2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCellViewController
        cell.data = self.data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = SelectedLocationViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}
