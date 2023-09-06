//
//  UICollectionViewCell.swift
//  CollectionView
//
//  Created by Alec on 06.09.23.
//

import Foundation
import UIKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - UICollectionViewCell.Extension -
// /////////////////////////////////////////////////////////////////////////

public extension UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
