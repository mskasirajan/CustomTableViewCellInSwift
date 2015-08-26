//
//  TVCustomCell.swift
//  CustomUITableViewCell
//
//  Created by kasirajan on 25/08/15.
//  Copyright © 2015 kasi. All rights reserved.
//

import UIKit

class TVCustomCell : UITableViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didPressShareBtn(sender: AnyObject) {
        print("share button")
    }
    
    func configWithDictionary(dictionary: NSDictionary) {
        bannerImageView.image = UIImage(named: (dictionary.objectForKey("image") as? String)!)
        titleLbl.text = dictionary.objectForKey("title")! as? String
        descLbl.text = dictionary.objectForKey("desc")! as? String
        descLbl.sizeToFit()
    }
}