//
//  Achievements.swift
//  stash
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

struct Achievements {
    
    var success: Int
    var status: Int
    var overview: Dictionary<String, String>
    var achievements: [[String:Any]]
    
    init(_ json: [String:Any]) {
        success = json["success"] as! Int
        status = json["status"] as! Int
        overview = json["overview"] as! Dictionary<String, String>
        achievements = json["achievements"] as! [[String:Any]]
    }
}

struct Achievement: Decodable {
    
    var id: Int
    var level: String
    var progress: Int
    var total: Int
    var bgImageUrl: String
    var accessible: Bool
    
    init(_ json: [String:Any]) {
        id = json["id"] as! Int
        level = json["level"] as! String
        progress = json["progress"] as! Int
        total = json["total"] as! Int
        bgImageUrl = json["bg_image_url"] as! String
        accessible = json["accessible"] as! Bool
    }
    
    mutating func increaseProgress() {
        
        switch self.progress {
            
        case 0, 10, 20, 30, 40:
            progress += 10
        default:
            return
        }
        
    }
    
    
}

