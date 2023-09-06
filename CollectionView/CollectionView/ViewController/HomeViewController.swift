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
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Int> = UICollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: {_,_,_  in return nil })
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - HomeViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = self.configureLayout()
        self.collectionView.register(NumberCell.self, forCellWithReuseIdentifier: NumberCell.reusidentifier)
        self.configureDataSource()
        
        self.view.addSubview(self.collectionView)
        
        self.makeConstraints()
    }

    func makeConstraints() {
        
        self.collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // /////////////////////////////////////////////////////////////////////////
    // MARK: - Functions
    
    func configureLayout() -> UICollectionViewCompositionalLayout {
        
        // .fractionalWidth(1.0): full with of its parent
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // add it to a group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // define section
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {
        
        // define the datasource and setup cell
        self.dataSource = UICollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { (collectionView, indexPath, number) -> UICollectionViewCell? in
            
            guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reusidentifier, for: indexPath) as? NumberCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.textLabel.text = number.description
            
            return cell
        })
        
        // define snapshot
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(Array(1...100))
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
}

