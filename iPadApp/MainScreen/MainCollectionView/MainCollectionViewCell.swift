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
        view.backgroundColor = UIColor(named: "white")
        view.layer.cornerRadius = Constants.Sizes.cornerRadius
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var shadows: UIView = {
        var shadows = UIView()
        shadows.clipsToBounds = true
        shadows.translatesAutoresizingMaskIntoConstraints = false
        shadows.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: self.contentView.bounds.height)

        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 6)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        layer0.shadowOpacity = 1
        layer0.shadowRadius = 16
        layer0.shadowOffset = CGSize(width: 0, height: 6)
        
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        layer0.masksToBounds = false
        shadows.layer.addSublayer(layer0)

        let shadowPath1 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 6)
        let layer1 = CALayer()
        layer1.shadowPath = shadowPath1.cgPath
        layer1.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.03).cgColor
        layer1.shadowOpacity = 1
        layer1.shadowRadius = 8
        layer1.shadowOffset = CGSize(width: 0, height: 1)
        
        layer1.bounds = shadows.bounds
        layer1.position = shadows.center
        layer1.masksToBounds = false
        shadows.layer.addSublayer(layer1)

        let shadowPath2 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 6)
        let layer2 = CALayer()
        layer2.shadowPath = shadowPath2.cgPath
        layer2.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.21).cgColor
        layer2.shadowOpacity = 1
        layer2.shadowRadius = 2
        layer2.shadowOffset = CGSize(width: 0, height: 1)
        
        layer2.bounds = shadows.bounds
        layer2.position = shadows.center
        layer2.masksToBounds = false
        shadows.layer.addSublayer(layer2)

        let shadowPath3 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 6)
        let layer3 = CALayer()
        layer3.shadowPath = shadowPath3.cgPath
        layer3.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer3.shadowOpacity = 1
        layer3.shadowRadius = 42
        layer3.shadowOffset = CGSize(width: 0, height: 12)
        
        layer3.bounds = shadows.bounds
        layer3.position = shadows.center
        layer3.masksToBounds = false
        shadows.layer.addSublayer(layer3)
        
        shadows.layer.masksToBounds = false
        return shadows
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
        label.textColor = UIColor(named: "black")
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
        label.textColor = UIColor(named: "white")
        label.font = Constants.Font.textExtraSmall
        label.backgroundColor = UIColor(named: "red")
        label.adjustsFontSizeToFitWidth = true
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
        
        addSubview(shadows)
        
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
