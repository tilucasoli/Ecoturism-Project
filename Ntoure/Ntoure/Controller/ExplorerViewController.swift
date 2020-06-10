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
}

class ExplorerViewController: UIViewController {
    
    let data = [
        CustomData(title: "Canoa Quebrada", distance: "136 Km", image: #imageLiteral(resourceName: "canoa")),
        CustomData(title: "Parque do Cocó", distance: "13 Km", image: #imageLiteral(resourceName: "Parque"))
    ]
    
    
    
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout ()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Explorar"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
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
    fileprivate let title: UILabel = {
        let text = UILabel()

        text.textColor = UIColor.white
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 25)
        return text
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        contentView.addSubview(bg)
        contentView.addSubview(title)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
