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
        bgImageView.setCornerRadius(to: 10)
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
        ptsLabel.text = "\(progress)pts"
        levelLabel.text = achievement?.level
        listProgressBar.progress = Float(progress) / Float(50)
    }
    
}
