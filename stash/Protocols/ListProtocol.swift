//
//  ListProtocol.swift
//  stash
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit


// Delegate for custom layout
protocol LayoutDelegate: class {
    
    func collectionView(collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat
    
    var numberOfColumns: Int { get set }
    
}

class ListLayout: UICollectionViewFlowLayout {
    
    //1. Layout Delegate
    weak var delegate: LayoutDelegate!
    
    //3. Array to keep a cache of attributes.
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    //4. Content height and size
    fileprivate var contentHeight: CGFloat = 0
    
    fileprivate var contentWidth: CGFloat {
        
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        
        // 1. Only calculate once
        guard let collectionView = collectionView else { return }
        // 2. Pre-Calculates the X Offset for every column and adds an array to increment the currently max Y Offset for each column
        
        let columnWidth = contentWidth / CGFloat(delegate.numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< delegate.numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var yOffset = [CGFloat](repeating: 0, count: delegate.numberOfColumns)
        
        // 3. Iterates through the list of items in the first section
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            // 4. Asks the delegate for the height of the picture and the annotation and calculates the cell frame.
            let width = columnWidth - Constants.cellPadding * 2
            let photoHeight = delegate.collectionView(collectionView: collectionView, heightForPhotoAt: indexPath, with: width)
            
            
            let height: CGFloat = Constants.cellPadding + photoHeight + Constants.cellPadding
            
            // Find the shortest column to place this item
            var shortestColumn = 0
            if let minYOffset = yOffset.min() {
                shortestColumn = yOffset.index(of: minYOffset) ?? 0
            }
            
            let frame = CGRect(x: xOffset[shortestColumn], y: yOffset[shortestColumn], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: Constants.cellPadding, dy: Constants.cellPadding)
            
            // Create our attributes
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // Updates
            contentHeight = max(contentHeight, frame.maxY)
            
            yOffset[shortestColumn] = yOffset[shortestColumn] + height
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            //if attributes.frame.intersects(rect)
            if attributes.representedElementCategory == .cell {
                visibleLayoutAttributes.append(attributes)
            }
            else if attributes.representedElementCategory == .supplementaryView {
                
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    
    
    
    
}
