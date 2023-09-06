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
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.textLabel)
        
        self.backgroundColor = .systemPurple
        
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
