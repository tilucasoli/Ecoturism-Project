//
//  ExplorerViewController.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 08/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

struct CustomData {
    var title: String
    var distance: String
    var image: UIImage
    var state: String?
}

class ExplorerViewController: UIViewController {
    
    //places example
    let data = [
        CustomData(title: "Canoa Quebrada", distance: "136 Km", image: #imageLiteral(resourceName: "canoa")),
        CustomData(title: "Parque do Cocó", distance: "13 Km", image: #imageLiteral(resourceName: "Parque") )
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCellViewController.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
//    fileprivate let location: UILabel = {
//       let text = UILabel()
//        text.text = "Ceará, Brasil"
//        text.textColor = UIColor.black
//        text.translatesAutoresizingMaskIntoConstraints = false
//        text.textAlignment = .center
//        text.font = UIFont.boldSystemFont(ofSize: 18)
//        return text
//    }()
    
    fileprivate let searchBar: UISearchController = {
        let searchBar = UISearchController(searchResultsController: nil)
        searchBar.searchBar.placeholder = "Try Canoa Quebrada"
        searchBar.searchBar.searchBarStyle = .minimal
        searchBar.definesPresentationContext = true
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explorar"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleStyle
        navigationItem.searchController = searchBar //SearchController here
        
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        //view.addSubview(location)
        
        collectionView.backgroundColor = .white
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
//        location.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
//        location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}
extension ExplorerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.2, height: collectionView.frame.height/1.65)
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
        // select function here
    }
}


