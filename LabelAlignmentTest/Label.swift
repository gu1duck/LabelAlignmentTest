//
//  Label.swift
//  LabelAlignmentTest
//
//  Created by Jeremy Petter on 2016-06-28.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class Label: UILabel {

    static let labelTextDidChangeNotification = "labelTextDidChangeNotification"

    override var text: String? {
        didSet {
            NSNotificationCenter.defaultCenter().postNotificationName(Label.labelTextDidChangeNotification, object: self)
        }
    }
}
