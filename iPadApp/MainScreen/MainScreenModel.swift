//
//  MainScreenModel.swift
//  iPadApp
//
//  Created by Егор Худяев on 14.03.2023.
//

import Foundation

struct MainScreenModel {
    struct Model {
        let title: String
        let count: Int
    }
    
    var list: [Model] = [Model(title: "Первая ячейка", count: 0),
                         Model(title: "Вторая ячейка", count: 11),
                         Model(title: "Третья ячейка", count: 222),
                         Model(title: "Четвертая ячейка", count: 3),
                         Model(title: "Пятая ячейка", count: 4),
                         Model(title: "Шестая ячейка", count: 5),
                         Model(title: "Седьмая ячейка", count: 6),
                         Model(title: "Первая ячейка", count: 0),
                         Model(title: "Вторая ячейка", count: 11),
                         Model(title: "Третья ячейка", count: 222),
                         Model(title: "Четвертая ячейка", count: 3),
                         Model(title: "Пятая ячейка", count: 4),
                         Model(title: "Шестая ячейка", count: 5),
                         Model(title: "Седьмая ячейка", count: 6)]
}
