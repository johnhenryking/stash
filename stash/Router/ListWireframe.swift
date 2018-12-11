//
//  ListWireframe.swift
//  stash
//
//  Created by User on 12/11/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

class ListWireframe {
    
    func routeSelection(with presenter: ListCollectionViewController, cell: ListCollectionViewCell, bool: Bool?, index: Int) {
        
        switch bool  {
            
        case true:
            if cell.achievement?.progress == 40 {
                presenter.unlockNewLevel(currentIndex: index)
            }
            cell.achievement?.increaseProgress()
        case false:
            presenter.presentAlert(title: Constants.lockedTitle, message: Constants.lockedMessage)
        default:
            return
        }
        
        
    }
    
    
    
}
