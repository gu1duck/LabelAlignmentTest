//
//  TableViewCell.swift
//  LabelAlignmentTest
//
//  Created by Jeremy Petter on 2016-06-24.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let defaultReuseIdentifier = "TableViewCellReuseIdentifier"

    private static let labelFont = UIFont(name: "Courier", size: 6.248983) // ~1% screen width for iPhone 6 in protrait
    private static let defaultmarginSize: CGFloat = 8.0

    // MARK: Initialization

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        completeInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        completeInitialization()
    }

    private func completeInitialization() {
        addSubview(leftLabel)
        addSubview(rightLabel)

        var layoutConstraints = constraints([
            "V:|[leftLabel]|": [],
            "H:|-[leftLabel]-[rightLabel]-|": [NSLayoutFormatOptions.AlignAllTop, NSLayoutFormatOptions.AlignAllBottom],
            ], metrics: nil)

        let leftMultiplier: CGFloat = 2.0 / 3.0
        let rightMultiplier: CGFloat = 1.0 / 3.0

        let marginAdjustment: CGFloat = -(TableViewCell.defaultmarginSize * 3.0)

        let leftLabelConstraint = leftLabel.widthAnchor.constraintGreaterThanOrEqualToAnchor(contentView.widthAnchor, multiplier: leftMultiplier, constant: marginAdjustment * leftMultiplier)
        leftLabelConstraint.priority = UILayoutPriorityDefaultHigh

        let rightLabelConstriant = rightLabel.widthAnchor.constraintGreaterThanOrEqualToAnchor(contentView.widthAnchor, multiplier: rightMultiplier, constant: marginAdjustment * rightMultiplier)
        rightLabelConstriant.priority = UILayoutPriorityDefaultHigh

        layoutConstraints.appendContentsOf([leftLabelConstraint, rightLabelConstriant])

        toggleActive(true, constraints: layoutConstraints)
    }

    //MARK: Public Setup

    func setUpWith(leftLabelCharacters:Int, rightLabelCharacters: Int)
    {
        let stringFromInt = { (numberOfChars:Int) -> String in
            var string = ""
            for index in 1...numberOfChars {
                string = string + String(index % 10)
            }
            return string
        }

        leftLabel.text = stringFromInt(leftLabelCharacters)
        rightLabel.text = stringFromInt(rightLabelCharacters)

        setNeedsUpdateConstraints()
    }

    // MARK: Helper Methods

    private func constraints(formats: [String: NSLayoutFormatOptions], metrics: [String: AnyObject]?) -> [NSLayoutConstraint] {

        let views = [
            "leftLabel": leftLabel,
            "rightLabel": rightLabel
        ]

        var constraints = [NSLayoutConstraint]()

        for (key, value) in formats {
            constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat(key, options: value, metrics: metrics, views: views))
        }

        return constraints
    }

    func toggleActive(active: Bool, constraints: [NSLayoutConstraint]) {
        _ = constraints.map { $0.active = active }
    }

    //MARK: Lazy Properties

    private lazy var leftLabel: Label = {
        let label = Label()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .yellowColor()
        label.font = TableViewCell.labelFont
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)

        return label
    }()

    private lazy var rightLabel: Label = {
        let label = Label()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .Right
        label.font = TableViewCell.labelFont
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh, forAxis: .Horizontal)

        return label
    }()
}
