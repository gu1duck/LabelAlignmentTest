//
//  TableViewController.swift
//  LabelAlignmentTest
//
//  Created by Jeremy Petter on 2016-06-24.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override init(style: UITableViewStyle) {
        super.init(style: style)
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: TableViewCell.defaultReuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: TableViewCell.defaultReuseIdentifier)
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.defaultReuseIdentifier, forIndexPath: indexPath) as! TableViewCell

        switch indexPath.row {
        case 0:
            cell.setUpWith(50, rightLabelCharacters: 50)
        case 1:
            cell.setUpWith(60, rightLabelCharacters: 50)
        case 2:
            cell.setUpWith(70, rightLabelCharacters: 50)
        case 3:
            cell.setUpWith(80, rightLabelCharacters: 30)
        case 4:
            cell.setUpWith(40, rightLabelCharacters: 70)
        case 5:
            cell.setUpWith(20, rightLabelCharacters: 70)
        default:
            break
        }

        return cell
    }
}
