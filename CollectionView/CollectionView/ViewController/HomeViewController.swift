//
//  ViewController.swift
//  CollectionView
//
//  Created by Alec on 06.09.23.
//

import UIKit
import SnapKit

// /////////////////////////////////////////////////////////////////////////
// MARK: - HomeViewController -
// /////////////////////////////////////////////////////////////////////////

class HomeViewController: UIViewController {
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Properties
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = self.configureLayout()
        self.collectionView.backgroundColor = .green
        
        self.view.backgroundColor = .brown
        
        self.view.addSubview(self.collectionView)
        
        self.makeConstraints()
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - HomeViewController

    func makeConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Functions
    
    func configureLayout() -> UICollectionViewCompositionalLayout {
        
        // .fractionalWidth(1.0): full with of its parent
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // add it to a group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // define section
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }

}

