//
//  CVCustomCell.swift
//  CustomUITableViewCell
//
//  Created by contus on 05/10/15.
//  Copyright © 2015 kasi. All rights reserved.
//

import UIKit

class CVCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var indexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        
    func configureCell(index: Int) {
        indexLabel.text = String(index) as String
    }
}
