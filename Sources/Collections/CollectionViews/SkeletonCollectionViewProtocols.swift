//
//  SkeletonCollectionViewProtocols.swift
//  SkeletonView-iOS
//
//  Created by Juanpe Catalán on 06/11/2017.
//  Copyright © 2017 SkeletonView. All rights reserved.
//

import UIKit


public protocol SkeletonCollectionViewDataSource: UICollectionViewDataSource {
    func numSections(in collectionSkeletonView: UICollectionView) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier
    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewIdentifierOfKind: String, at indexPath: IndexPath) -> ReusableCellIdentifier?
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewOfKind: String, at indexPath: IndexPath) -> UICollectionReusableView
}

public extension SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skeletonView.estimatedNumberOfRows
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView,
                                supplementaryViewIdentifierOfKind: String,
                                at indexPath: IndexPath) -> ReusableCellIdentifier? {
        return nil
    }
    
    func numSections(in collectionSkeletonView: UICollectionView) -> Int { return 1 }

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = collectionSkeletonView(skeletonView, cellIdentifierForItemAt: indexPath)
        return skeletonView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, supplementaryViewOfKind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let viewIdentifier = collectionSkeletonView(skeletonView, supplementaryViewIdentifierOfKind: supplementaryViewOfKind, at: indexPath) {
            return skeletonView.dequeueReusableSupplementaryView(ofKind: supplementaryViewOfKind, withReuseIdentifier: viewIdentifier, for: indexPath)
        }

        return UICollectionReusableView()
    }
}

public protocol SkeletonCollectionViewDelegate: UICollectionViewDelegate { }

