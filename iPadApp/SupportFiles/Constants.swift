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
    
    enum Colors {
        static let green = UIColor(red: 39, green: 153, blue: 33, alpha: 1)
        static let main = UIColor(red: 0, green: 0, blue: 0, alpha: 0.87)
        static let grey = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        static let red = UIColor(red: 253, green: 64, blue: 22, alpha: 1)
        static let white = UIColor(red: 255, green: 255, blue: 255, alpha: 0.94)
    }
    
    enum Sizes {
        static let screenHeight = UIScreen.main.bounds.height
        static let screenWidth = UIScreen.main.bounds.width
        static let cornerRadius: CGFloat = 6
    }
    
    enum Default {
        static let badConnection =  "https://storage.yandexcloud.net/printio/assets/realistic_views/round_mouse_pad/detailed/02c38a14fea7f3aea392ec09c2e32e955ad35361.jpg?1593264253"
        static let grayHolder = "https://abrakadabra.fun/uploads/posts/2022-02/thumbs/1644218803_39-abrakadabra-fun-p-svetlo-serii-fon-tekstura-53.jpg"
        static let whiteHilder = "https://sm.ign.com/t/ign_in/video/t/the-ps3-is-too-high/the-ps3-is-too-high_h3m7.1200.jpg"
    }
}
