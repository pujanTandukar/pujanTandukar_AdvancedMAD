//
//  TableViewCell.swift
//  project1
//
//  Created by Pujan Tandukar on 3/7/18.
//  Copyright © 2018 Pujan Tandukar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var memoryImageView: UIImageView!
    @IBOutlet weak var memoryNameLabel: UILabel!
    @IBOutlet weak var memoryDateLabel: UILabel!
    @IBOutlet weak var memoryDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.shadowColor = UIColor(red: 0, green: 0, blue:0, alpha:1).cgColor
        mainView.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        mainView.layer.shadowRadius = 1.7
        mainView.layer.shadowOpacity = 0.2
        mainView.layer.cornerRadius = 10
        memoryImageView.layer.borderWidth = 1
        memoryImageView.layer.shadowColor = UIColor(red: 0, green: 0, blue:0, alpha:1).cgColor
        memoryImageView.layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
        memoryImageView.layer.shadowRadius = 1
        memoryImageView.layer.shadowOpacity = 0.2
        memoryImageView.layer.cornerRadius = 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(memory: Memory){
        self.memoryNameLabel.text = memory.name
        self.memoryDescriptionLabel.text = memory.description
        self.memoryImageView.image = UIImage(data: memory.image as Data)
    }
}
