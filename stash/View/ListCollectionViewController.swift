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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.getAchievements(for: self)
        self.collectionViewLayout()
    }
    
    // MARK: UICollectionViewDataSource
    
    var numberOfColumns = 1
    
    lazy var layout = self.collectionView.collectionViewLayout as? ListLayout
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        cell.achievement = achievements[indexPath.item]
        return cell
    }
    
    func collectionViewLayout() {
        self.layout?.delegate = self
        self.layout?.collectionView?.contentInset = UIEdgeInsets(top: Constants.cellPadding, left: Constants.cellPadding, bottom: Constants.cellPadding, right: Constants.cellPadding)
    }
    
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
       
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect = AVMakeRect(aspectRatio: Constants.photoSize, insideRect: boundingRect)
        return rect.size.height
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ListCollectionViewCell
        router.routeSelection(with: self, cell: cell, bool: cell.achievement?.accessible, index: indexPath.item)
    }
    

}
