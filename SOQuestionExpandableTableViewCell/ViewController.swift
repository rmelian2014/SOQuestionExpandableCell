//
//  ViewController.swift
//  SOQuestionExpandableTableViewCell
//
//  Created by Reinier Melian on 18/06/2017.
//  Copyright © 2017 Pruebas. All rights reserved.
//

import UIKit

class ViewController: UIViewController,OptionButtonsDelegate {
    
    @IBOutlet var tableView: UITableView!
    var datasource = [ExpandingTableViewCellContent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView() // Removes empty cell separators
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        datasource = [ExpandingTableViewCellContent(pickupLocation: "Salmiya",
                                                    dropLocation: "Farwaniyad"),
                      ExpandingTableViewCellContent(pickupLocation: "Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis .",
                                                    dropLocation: "Etiam porta sem malesuada magna mollis euismod. Nullam quis risus urna mollis ornare vel eu leo."),
                      ExpandingTableViewCellContent(pickupLocation: "Aenean lacinia bibendum nulla sed consectetur.",
                                                    dropLocation: "Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec id elit non mi porta gravida at eget metus.")]
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       let currentExpandingContext = datasource[indexPath.row]
        if(currentExpandingContext.expanded)
        {
            return ExpandingTableViewCell.expandedHeigth
        }else
        {
            return ExpandingTableViewCell.collapsedHeigth//fixed heigth
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: String(describing: ExpandingTableViewCell.self), for: indexPath) as! ExpandingTableViewCell
        cell.set(content: datasource[indexPath.row])
        cell.delegate = self
        cell.indexPath = indexPath
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = datasource[indexPath.row]
        content.expanded = !content.expanded
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func closeFriendsTapped(at index: IndexPath) {
        print("button tapped at index:\(index.row)")
    }
    
}
