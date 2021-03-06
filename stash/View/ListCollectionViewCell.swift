//
//  ListCollectionViewCell.swift
//  stash
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Set corner radius and rounded for properties
        bgImageView.setCornerRadius(to: Constants.cellPadding-5)
        listProgressBar.roundEdges()
        levelBackgroundView.setRounded()
    }
    
    // IBOoutlets and Varibales
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var listProgressBar: UIProgressView!
    @IBOutlet weak var ptsLabel: UILabel!
    @IBOutlet weak var levelBackgroundView: UIView!
    @IBOutlet weak var levelLabel: UILabel!
    
    var achievement: Achievement? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        bgImageView.setImage(with: achievement?.bgImageUrl)
        let progress = achievement?.progress ?? 0
        ptsLabel.text = Constants.show(progress)
        levelLabel.text = achievement?.level
        self.listProgressBar.setProgress(Float(progress) / Float(50), animated: true)
        if achievement?.accessible == false { self.alpha = 0.5 }
    }
    
}
