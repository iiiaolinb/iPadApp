//
//  MainCollectionViewCell.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let cellId = "MainCollectionViewCell"
    
    lazy var mainViewForCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Constants.Sizes.cornerRadius
        view.clipsToBounds = true
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 1
        view.layer.masksToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "iconClock")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.backgroundColor = .clear
        label.font = Constants.Font.textMedium
        label.textColor = Constants.Colors.main
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.textColor = .white
        label.font = Constants.Font.textExtraSmall
        label.backgroundColor = .red
        label.adjustsFontSizeToFitWidth = true
        //label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        let imageSize = CGSize(width: 36, height: 36)
        let badgeSize = CGSize(width: 22, height: 22)
        let imageAndTitleInset: CGFloat = 20
        let mainViewInset: CGFloat = 5
        //let sizeForItem = Constants.Sizes.screenWidth / 3
        
        addSubview(mainViewForCell)
        mainViewForCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: mainViewInset).isActive = true
        mainViewForCell.topAnchor.constraint(equalTo: topAnchor, constant: mainViewInset).isActive = true
        mainViewForCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -mainViewInset).isActive = true
        mainViewForCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -mainViewInset).isActive = true
        
        addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: mainViewForCell.leadingAnchor, constant: imageAndTitleInset).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageSize.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize.height).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: imageAndTitleInset).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: imageAndTitleInset).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -imageAndTitleInset).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -imageAndTitleInset).isActive = true
        
        addSubview(badgeLabel)
        badgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        badgeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        badgeLabel.widthAnchor.constraint(equalToConstant: badgeSize.width).isActive = true
        badgeLabel.heightAnchor.constraint(equalToConstant: badgeSize.height).isActive = true
    }
}
