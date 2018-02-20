//
//  NothingFoundCell.swift
//  StoreSearch
//
//  Created by Campbell Graham on 20/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class NothingFoundCell: UITableViewCell {
    
    let nothingFoundLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nothingFoundLabel.text = "Nothing Found"
        
        nothingFoundLabel.textAlignment = .center
        
        addSubview(nothingFoundLabel)
        
        nothingFoundLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //nothing found label
            nothingFoundLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nothingFoundLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nothingFoundLabel.topAnchor.constraint(equalTo: topAnchor),
            nothingFoundLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            nothingFoundLabel.heightAnchor.constraint(equalToConstant: 80)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
