//
//  Constants.swift
//  stash
//
//  Created by User on 12/11/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

struct Constants {
    
    static let reuseIdentifier = "Cell"
    static let cellPadding: CGFloat = 15
    static let photoSize = CGSize(width: CGFloat(1030), height: CGFloat(684))
    static let level = "Level"
    static let title = "Smart Investing"
    static let pathResource = "achievements"
    static let pathType = "json"
    static let lockedTitle = "Level Locked"
    static let lockedMessage = "You have yet to unlocked this level."
    static func show(_ progress: Int) -> String {
        return "\(progress)pts"
    }
    static let completionTitle = "Congratulations!"
    static let completionMessage = "You've clicked your way to the next level!"
    
    
}
