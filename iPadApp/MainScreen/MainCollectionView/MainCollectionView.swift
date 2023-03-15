//
//  MainCollectionView.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import UIKit

class MainCollectionView: UICollectionView {
    
    private let model = MainScreenModel()
    
    let itemsOnRow: CGFloat = 3
    let rowsInSection = 2
    let cellsInset: CGFloat = 44
    lazy var cellSize = CGSize(width: (Constants.Sizes.screenWidth - (cellsInset * (itemsOnRow + 1))) / itemsOnRow,
                               height: 88)
    
    private lazy var edgeInsets = UIEdgeInsets(top: cellsInset / 2,
                                               left: cellsInset,
                                               bottom: cellsInset / 2,
                                               right: cellsInset)
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .clear
        
        delegate = self
        dataSource = self
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.cellId)
        
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func sizeForItem(in collectionView: UICollectionView) -> CGSize {
//        let paddingSpace = sectionInsets.left * (itemsOnRow)
//        let availableWidth = collectionView.frame.width - paddingSpace
//        let widthPerItem = floor(availableWidth / itemsOnRow)
//
//        return CGSize(width: widthPerItem, height: widthPerItem)
//    }
}

extension MainCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.cellId,
                                             for: indexPath) as? MainCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.titleLabel.text = model.list[indexPath.row].title
        
        let badge = String(model.list[indexPath.row].count).count <= 2 ? String(model.list[indexPath.row].count) : "99+"
        cell.badgeLabel.alpha = model.list[indexPath.row].count <= 0 ? 0 : 1
        cell.badgeLabel.text = badge
        
        return cell
    }
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return edgeInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
      return cellsInset
    }
}

extension MainCollectionView: UICollectionViewDelegate {
    
}
