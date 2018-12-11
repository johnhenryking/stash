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
                let indexPath = IndexPath(item: currentIndex + 1, section: 0)
                let cell = self.collectionView.cellForItem(at: indexPath) as! ListCollectionViewCell
                cell.achievement?.accessible = true
                cell.animateAlpha(to: 1.0)
                self.collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
            }
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupRefresher() {
        self.refresher = UIRefreshControl()
        self.refresher.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        self.collectionView!.addSubview(refresher)
    }
    
    @objc func reloadData() {
        self.collectionView.reloadData()
        self.refresher.endRefreshing()
    }
   
    
    
}
