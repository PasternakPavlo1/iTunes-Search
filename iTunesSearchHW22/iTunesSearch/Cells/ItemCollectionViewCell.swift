//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Павло Пастернак on 18.05.2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    
    // MARK: - Outlets
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
}
