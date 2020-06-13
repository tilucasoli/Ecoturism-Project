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
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // select function here
    }
}

class CustomCell: UICollectionViewCell {
    var data: CustomData? {
        didSet{
            guard let data = data else {return}
            bg.image = data.image
            title.text = data.title
            describ.text = data.distance
        }
    }
    
    fileprivate let bg: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
        
    }()
    fileprivate let gradient: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Rectangle 90")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    fileprivate let title: UILabel = {
        let text = UILabel()
        
        text.textColor = UIColor.white
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 25)
        return text
    }()
    
    fileprivate let describ: UILabel = {
        let text = UILabel()

        text.textColor = UIColor.white
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 15)
        return text
    }()
    
    fileprivate let icon: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Icon ionic-ios-pin")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        contentView.addSubview(gradient)
        contentView.addSubview(title)
        contentView.addSubview(icon)
        contentView.addSubview(describ)
        

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        gradient.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        gradient.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        gradient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        gradient.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        
        icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 7).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        describ.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -41).isActive = true
        describ.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
