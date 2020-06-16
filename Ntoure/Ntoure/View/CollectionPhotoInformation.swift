//
//  CollectionPhotoInformation.swift
//  Ntoure
//
//  Created by Anderson Alencar on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class CollectionPhotoInformation: UIView {
    
    let images = [UIImage(named: "canoaQuebrada3"), UIImage(named: "canoaQuebrada2"), UIImage(named: "canoaQuebrada1")]

    lazy var collectionPhotos: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.showsHorizontalScrollIndicator = false
        collection.isPagingEnabled = true
        collection.contentInsetAdjustmentBehavior = .never
        collection.delegate = self
        collection.dataSource = self
        collection.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: ViewcodeProtocol
extension CollectionPhotoInformation: ViewCode {
    func buildHierarchy() {
        addSubview(collectionPhotos)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionPhotos.topAnchor.constraint(equalTo: topAnchor),
            collectionPhotos.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionPhotos.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionPhotos.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }

    func aditionalConfigurations() {
        backgroundColor = .white
    }
}
// MARK: DelegateAndDataSource
extension CollectionPhotoInformation: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell
        cell?.image.image = images[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
}
// MARK: FlowLayoutDelegate
extension CollectionPhotoInformation: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionPhotos.bounds
        //let othersize = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
