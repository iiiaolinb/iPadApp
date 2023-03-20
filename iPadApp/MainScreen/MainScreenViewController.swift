//
//  ViewController.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import UIKit

class MainScreenViewController: UIViewController, UIPopoverPresentationControllerDelegate, UISearchBarDelegate {
    
    lazy var collectionView = MainCollectionView()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск документов"
        searchBar.searchTextField.backgroundColor = UIColor(named: "white")
        searchBar.layer.cornerRadius = 16
        searchBar.clipsToBounds = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var resolutionButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconResolution"), for: .normal)
        button.setTitle("  Дать поручение", for: .normal)
        button.setTitleColor(UIColor(named: "green"), for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "iconHelp"), for: .normal)
        button.setTitle("  Помощь", for: .normal)
        button.setTitleColor(UIColor(named: "black"), for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(onHelpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Обновлено 5 мин назад"
        label.font = Constants.Font.textExtraSmall
        label.textColor = UIColor(named: "grey")
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupConstraints()
    }
    
    @objc private func onHelpButtonTapped() {
        
        let tableViewController = PopoverTableView()
        tableViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        tableViewController.preferredContentSize = CGSize(width: 200, height: 88)
           
        self.present(tableViewController, animated: true, completion: nil)
           
        let popoverPresentationController = tableViewController.popoverPresentationController
        popoverPresentationController?.sourceView = helpButton
        popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: helpButton.frame.size.width, height: helpButton.frame.size.height)
        popoverPresentationController?.delegate = self
    }
    
    private func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleToFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    //MARK: - search bar delegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - constraints

    private func setupConstraints() {
        
        let rightLeftInset: CGFloat = 48
        let topInset: CGFloat = 54
        let bottomInset: CGFloat = 40
        let buttonSize = CGSize(width: 160, height: 24)
        let logoSize = CGSize(width: 186, height: 45)

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: topInset + topInset / 2 + logoSize.height).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                               constant: -(bottomInset + bottomInset / 2 + buttonSize.height)).isActive = true
        
        view.addSubview(logoImageView)
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: rightLeftInset).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: topInset).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 186).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        view.addSubview(searchBar)
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -rightLeftInset).isActive = true
        searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: topInset + 4).isActive = true
        searchBar.widthAnchor.constraint(equalToConstant: 280).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        view.addSubview(resolutionButton)
        resolutionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: rightLeftInset).isActive = true
        resolutionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomInset).isActive = true
        resolutionButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        resolutionButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true

        view.addSubview(helpButton)
        helpButton.leadingAnchor.constraint(equalTo: resolutionButton.trailingAnchor, constant: 24).isActive = true
        helpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomInset).isActive = true
        helpButton.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        helpButton.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true

        view.addSubview(infoLabel)
        infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -rightLeftInset).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottomInset).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
    }
}

