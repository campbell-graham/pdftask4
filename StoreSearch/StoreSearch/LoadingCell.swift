//
//  LoadingTableViewCell.swift
//  StoreSearch
//
//  Created by Campbell Graham on 21/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    var loadingLabel: UILabel
    var loadingIndicatorView: UIActivityIndicatorView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        //object initialization
        loadingLabel = UILabel()
        loadingIndicatorView = UIActivityIndicatorView()
        
        //required super call
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //colors
        loadingLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        loadingIndicatorView.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        //content setting
        loadingLabel.text = "Loading... "
        loadingLabel.font = UIFont.systemFont(ofSize: 15)
        
        //adding items to view
        addSubview(loadingLabel)
        addSubview(loadingIndicatorView)
        
        //layout constraints
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            

                loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),
                loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                loadingIndicatorView.leadingAnchor.constraint(equalTo: loadingLabel.trailingAnchor),
                loadingIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
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
