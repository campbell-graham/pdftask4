//
//  SearchResultsCell.swift
//  StoreSearch
//
//  Created by Campbell Graham on 20/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var artistNameLabel = UILabel()
    var artworkImageView = UIImageView()
    var downloadTask: URLSessionDownloadTask?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //color changes
        let selectedView = UIView(frame: .zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
        selectedBackgroundView = selectedView
        
        //add views
        addSubview(nameLabel)
        addSubview(artistNameLabel)
        addSubview(artworkImageView)
        
        //layout constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artworkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //image view
            artworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            artworkImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            artworkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            artworkImageView.heightAnchor.constraint(equalToConstant: 50),
            artworkImageView.widthAnchor.constraint(equalToConstant: 50),
            
            //name label
            nameLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            
            //artist label
            artistNameLabel.leadingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: 20),
            artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            artistNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            artistNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
            ])
        
        
    }
    
    func configure(for result: SearchResult) {
        nameLabel.text = result.name
        if result.artistName.isEmpty {
            artistNameLabel.text = "Unknown"
        } else {
            artistNameLabel.text = String(format: "%@ (%@)", result.artistName, result.type)
        }
        
        artworkImageView.image = UIImage(named: "Placeholder")
        if let smallURL = URL(string: result.imageSmall) {
            downloadTask = artworkImageView.loadImage(url: smallURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        downloadTask?.cancel()
        downloadTask = nil
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
