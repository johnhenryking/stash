//
//  ListInteractor.swift
//  stash
//
//  Created by User on 12/11/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

class ListInteractor {
    
    static var title: String?
    
    // Get achievements from json file 
    func getAchievements(for presenter: ListCollectionViewController) {
        
        if let filePath = Bundle.main.path(forResource: "achievements", ofType: "json"), let data = NSData(contentsOfFile: filePath) as Data? {
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers
                    ) as! [String:Any]
                let achievements = Achievements(json)
                achievements.achievements.forEach { (json) in
                    let achievement = Achievement(json)
                    presenter.achievements.append(achievement)
                }
                
                presenter.navigationItem.title = achievements.overview.values.first
                ListInteractor.title = achievements.overview.values.first
                print(ListInteractor.title)
                
            }
                
            catch let error {
                
                presenter.presentAlert(title: "Error", message: error.localizedDescription)
                
            }
        }
    }
    
}