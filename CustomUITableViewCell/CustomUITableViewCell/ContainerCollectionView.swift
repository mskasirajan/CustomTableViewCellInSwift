//
//  ContainerCollectionView.swift
//  CustomUITableViewCell
//
//  Created by contus on 05/10/15.
//  Copyright © 2015 kasi. All rights reserved.
//

import UIKit

protocol ChildViewControllerDelegate {
    func moveToIndex(index: Int)
}

class ContainerCollectionView: UICollectionViewController {

    var delegate:ChildViewControllerDelegate?
    var count:Int = 0
    
    // MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        // get array count
        if let parentVC = self.parentViewController as? ViewController {
            count = (parentVC.jsonDict.objectForKey("location")?.count)!
        }
    
        // reload collection view after get data from server (JSON response)
        dispatch_async(dispatch_get_main_queue(), {
            collectionView?.reloadData()
        })
    }
    
    // MARK: UICollectionView Delegate
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as? CVCustomCell
        
        cell!.backgroundColor = UIColor.grayColor()
        cell?.configureCell(indexPath.row + 1)
        
        return cell!
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        self.delegate?.moveToIndex(indexPath.row)
    }
    
}
