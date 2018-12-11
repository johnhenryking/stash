//
//  ListCollectionViewController.swift
//  stash
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit
import AVKit

class ListCollectionViewController: UICollectionViewController, LayoutDelegate {
    
    let interactor = ListInteractor()
    let router = ListWireframe()
    var achievements = [Achievement]()
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getAchievements(for: self)
        self.collectionViewLayout()
    }
    
    // MARK: UICollectionViewDataSource
    
    var numberOfColumns = 1
    
    // Flow layout for design requirements
    lazy var layout = self.collectionView.collectionViewLayout as? ListLayout
    
    //number of items in section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    //Cell for row at indexpath
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        cell.achievement = achievements[indexPath.item]
        return cell
    }
    
    // Setup collection view custom flow layout
    func collectionViewLayout() {
        self.layout?.delegate = self
        self.layout?.collectionView?.contentInset = UIEdgeInsets(top: Constants.cellPadding, left: Constants.cellPadding, bottom: Constants.cellPadding, right: Constants.cellPadding)
        self.setupRefresher()
    }
    
    // Height for dynamic photos
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
       
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: Constants.photoSize, insideRect: boundingRect)
        return rect.size.height
    }
    
    //Did Select Item at indexPath
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ListCollectionViewCell
        router.routeSelection(with: self, cell: cell, bool: cell.achievement?.accessible, index: indexPath.item)
    }
    
}
