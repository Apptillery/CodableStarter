//
//  JournalEntryTableViewCell.swift
//  Codable
//
//  Created by Alex Gibson on 6/6/17.
//  Copyright © 2017 Apptillery. All rights reserved.
//

import UIKit

class JournalEntryTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func configureWithEntry(entry:JournalEntry){
        entryLabel.text = entry.entryText
        identifierLabel.text = entry.identifier
        layoutIfNeeded()
    }
    
}
