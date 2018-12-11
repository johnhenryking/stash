//
//  ListPresenter.swift
//  stash
//
//  Created by User on 12/11/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

extension ListCollectionViewController {
    
    func unlockNewLevel(currentIndex: Int) {
        
        let alertController = UIAlertController(title: Constants.completionTitle, message: Constants.completionMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel) { (_) in
            if currentIndex + 1 <= self.achievements.count-1  {
                let cell = self.collectionView.cellForItem(at: IndexPath(item: currentIndex + 1, section: 0)) as! ListCollectionViewCell
                cell.achievement?.accessible = true
                cell.animateAlpha(to: 1.0)
            }
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
   
    
}
