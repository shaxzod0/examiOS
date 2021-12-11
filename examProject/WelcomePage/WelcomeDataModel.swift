//
//  WelcomeDataModel.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit

struct WelcomeModel{
    let header: String
    let defenition: String
    let image: UIImage
}

struct WelcomeDataModel{
    let data: [WelcomeModel] = [
        WelcomeModel(header: "WELCOME TO Monumental habits", defenition: "We can help you to be a better version of yourself.", image: #imageLiteral(resourceName: "pastedImage")),
        WelcomeModel(header: "CREATE NEW HABIT EASILY", defenition: "We can help you to be a better version of yourself.", image: #imageLiteral(resourceName: "habits")),
        WelcomeModel(header: "KEEP TRACK OF YOUR PROGRESS", defenition: "We can help you to be a better version of yourself.", image: #imageLiteral(resourceName: "progress")),
        WelcomeModel(header: "JOIN A SUPPORTIVE COMMUNITY", defenition: "We can help you to be a better version of yourself.", image: #imageLiteral(resourceName: "Community Support")),
    ]
    func getDataCount()->Int{
        return data.count
    }
    func getItem(index: Int)->WelcomeModel{
        return data[index]
    }
}
