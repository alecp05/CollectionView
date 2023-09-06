//
//  File.swift
//  CollectionView
//
//  Created by Alec on 06.09.23.
//

import Foundation
import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - NumberCell -
// /////////////////////////////////////////////////////////////////////////

class NumberCell: UICollectionViewCell {

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    private var textLabel: UILabel = UILabel()

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.makeConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - NumberCell
    
    func makeConstraints() {
        
        self.textLabel.snp.makeConstraints() { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(8)
        }
    }
}
