//
//  MainCollectionView.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import UIKit

class MainCollectionView: UICollectionView {
    
    private var model = MainScreenModel()
    
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
        dragDelegate = self
        dropDelegate = self
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.cellId)
        
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
    
//    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
//        return true
//    }
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

extension MainCollectionView: UICollectionViewDragDelegate {

    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {

        let item = model.list[indexPath.row].title
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item

        return [dragItem]
    }
}

extension MainCollectionView: UICollectionViewDropDelegate {

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {

        if self.hasActiveDrag {
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {

        var destinationIndexPath = IndexPath(row: 0, section: 0)

        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            let row = collectionView.numberOfItems(inSection: 0)
            destinationIndexPath = IndexPath(item: row - 1, section: 0)
        }

        for item in coordinator.items {
            if let sourceIndexPath = item.sourceIndexPath {
                collectionView.performBatchUpdates {
                    let cellInfo = model.list.remove(at: sourceIndexPath.item)
                    model.list.insert(cellInfo, at: destinationIndexPath.item)
                    collectionView.deleteItems(at: [sourceIndexPath])
                    collectionView.insertItems(at: [destinationIndexPath])
                }
                coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            }
        }
    }
}
