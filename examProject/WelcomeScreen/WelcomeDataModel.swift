//
//  WelcomeDataModel.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit

struct WelcomeModel {
    let name: String
    let definition: String
    let image: UIImage
}


struct WelcomeDataModel{
   private let data: [WelcomeModel] = [
        WelcomeModel(name: "Telegram", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "Habits")),
        WelcomeModel(name: "Fast", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "Habits")),
        WelcomeModel(name: "Free", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "Community Support")),
        WelcomeModel(name: "Powerful", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "pasted image")),
        WelcomeModel(name: "Secure", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "Community Support")),
        WelcomeModel(name: "Cloud-Based", definition: "Telegram delivers messages", image: #imageLiteral(resourceName: "Habits"))
    ]
    func getDataCount() -> Int {
        return data.count
    }
    
    func getItem(index: Int) -> WelcomeModel {
        return data[index]
    }
    
    
}
