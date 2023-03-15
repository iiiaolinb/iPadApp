//
//  Constants.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import UIKit

enum Constants {
    enum Font {
        static var textHeader1 = UIFont(name: "SFProDisplay-Regular", size: 28)
        static var textMain = UIFont(name: "SFProDisplay-Regular", size: 25)
        static var textMedium = UIFont(name: "SFProDisplay-Regular", size: 20)
        static var textSmall = UIFont(name: "SFProDisplay-Regular", size: 17)
        static var textExtraSmall = UIFont(name: "SFProDisplay-Regular", size: 15)
    }
    
    enum Sizes {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
        static let cornerRadius: CGFloat = 6
    }
}
