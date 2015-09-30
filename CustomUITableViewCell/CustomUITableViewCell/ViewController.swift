//
//  ViewController.swift
//  CustomUITableViewCell
//
//  Created by kasirajan on 25/08/15.
//  Copyright © 2015 kasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var jsonDict: NSDictionary = NSDictionary ()
    
    // MARK: lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get json data
        let jsonData = self.readjson("location")
        
        // parse json data and store in dictionary
        do {
            jsonDict = try NSJSONSerialization.JSONObjectWithData(jsonData, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
        } catch { // report error
        }
    
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UITableView Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (jsonDict.objectForKey("location")?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! TVCustomCell
        
        let dict = jsonDict .objectForKey("location")! .objectAtIndex(indexPath.row)
        cell.configWithDictionary(dict as! NSDictionary)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let dictionary = jsonDict .objectForKey("location")! .objectAtIndex(indexPath.row)
        let font: UIFont = UIFont (name: "Helvetica", size: 13.0)!
        let descText: String = (dictionary.objectForKey("desc")! as? String)!
        let newlineString: String = "\n"
        let newDescText: String = descText.stringByReplacingOccurrencesOfString("\\n", withString: newlineString)
        
        let boundingRect = (newDescText as NSString).boundingRectWithSize(CGSizeMake(268, 4000), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
        let boudingSize: CGSize = boundingRect
        
        return (200 - 15 + boudingSize.height)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = NSIndexPath(forRow: 4, inSection: 0)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
    }
    
    // MARK: Private Method Implementations
    
    func readjson(fileName: String) -> NSData{
        
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let jsonData = NSData(contentsOfMappedFile: path!)
        
        return jsonData!
    }
}

