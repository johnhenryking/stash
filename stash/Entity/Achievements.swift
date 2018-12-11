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
    
    
}

//{
//    "success": true,
//    "status": 200,
//    "overview": {
//        "title": "Smart Investing"
//    },
//    "achievements": [
//    {
//    "id": 4,
//    "level": "1",
//    "progress": 10,
//    "total": 50,
//    "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
//    "accessible": true
//    },
//    {
//    "id": 3,
//    "level": "2",
//    "progress": 0,
//    "total": 50,
//    "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png",
//    "accessible": false
//    },
//    {
//    "id": 5,
//    "level": "3",
//    "progress": 0,
//    "total": 50,
//    "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C60F6868-A0CD-4D9D-A3B9-3C460FA989FF.png",
//    "accessible": false
//    }
//    ]
//}
