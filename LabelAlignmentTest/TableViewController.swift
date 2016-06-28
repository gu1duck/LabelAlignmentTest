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
            cell.leftLabel.text = "01234567890123456789012345678901234567890123456789"
            cell.rightLabel.text = "01234567890123456789012345678901234567890123456789"
        case 1:
            cell.leftLabel.text = "012345678901234567890123456789012345678901234567890123456789"
            cell.rightLabel.text = "01234567890123456789012345678901234567890123456789"
        case 2:
            cell.leftLabel.text = "0123456789012345678901234567890123456789012345678901234567890123456789"
            cell.rightLabel.text = "01234567890123456789012345678901234567890123456789"
        case 3:
            cell.leftLabel.text = "01234567890123456789012345678901234567890123456789012345678901234567890123456789"
            cell.rightLabel.text = "012345678901234567890123456789"
        case 4:
            cell.leftLabel.text = "0123456789012345678901234567890123456789"
            cell.rightLabel.text = "0123456789012345678901234567890123456789012345678901234567890123456789"
        case 5:
            cell.leftLabel.text = "01234567890123456789"
            cell.rightLabel.text = "0123456789012345678901234567890123456789012345678901234567890123456789"
        default:
            break
        }

        return cell
    }
}
