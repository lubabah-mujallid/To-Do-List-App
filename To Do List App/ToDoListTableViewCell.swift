//
//  ToDoListTableViewCell.swift
//  To Do List App
//
//  Created by admin on 19/12/2021.
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    
    @IBOutlet var cellLabels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
