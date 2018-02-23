//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Campbell Graham on 21/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = UIView()
    let imageView = UIImageView()
    let closeButton = UIButton()
    let nameLabel = UILabel()
    let artistLabel = UILabel()
    let typeLabel = UILabel()
    let kindValueLabel = UILabel()
    let genreLabel = UILabel()
    let genreValueLabel = UILabel()
    let priceButton = UIButton()
    let searchResult: SearchResult!
    var downloadTask: URLSessionDownloadTask?
    
    init(searchResult: SearchResult!) {
        self.searchResult = searchResult
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //round the corners of the detail view
        detailView.layer.cornerRadius = 10
        
        //background colours
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        detailView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.95)
        
        //add detail view to main view
        view.addSubview(detailView)
        
        //button formatting
        closeButton.setTitle("X", for: .normal)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        closeButton.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        closeButton.layer.cornerRadius = 5
        priceButton.setTitleColor(view.tintColor, for: .normal)
        priceButton.addTarget(self, action: #selector(openInStore), for: .touchUpInside)
        
        //label formatting
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.numberOfLines = 3
        artistLabel.font = UIFont.systemFont(ofSize: 15)
        artistLabel.numberOfLines = 2
        typeLabel.font = UIFont.systemFont(ofSize: 14)
       // typeLabel.setContentHuggingPriority(.required, for: .horizontal)
        kindValueLabel.font = UIFont.systemFont(ofSize: 14)
        genreLabel.font = UIFont.systemFont(ofSize: 14)
        //genreLabel.setContentHuggingPriority(.required, for: .horizontal)
        genreValueLabel.font = UIFont.systemFont(ofSize: 14)
        typeLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        genreLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        //layout constraints for main view
        detailView.translatesAutoresizingMaskIntoConstraints = false
      
//        NSLayoutConstraint.activate([
//            detailView.widthAnchor.constraint(equalToConstant: 240),
//           // detailView.heightAnchor.constraint(equalToConstant: 240),
//            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        //add items to the detail view
        detailView.addSubview(closeButton)
        detailView.addSubview(imageView)
        detailView.addSubview(nameLabel)
        detailView.addSubview(artistLabel)
        detailView.addSubview(typeLabel)
        detailView.addSubview(kindValueLabel)
        detailView.addSubview(genreLabel)
        detailView.addSubview(genreValueLabel)
        detailView.addSubview(priceButton)
        
        populateInformation()
    }
    
    override func viewWillLayoutSubviews() {
        //layout constaints for detail view
        typeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        genreLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        kindValueLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreValueLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        let views: [String: Any] = [
            "closeButton" : closeButton,
            "imageView" : imageView,
            "nameLabel" : nameLabel,
            "artistLabel" : artistLabel,
            "typeLabel" : typeLabel,
            "kindValueLabel" : kindValueLabel,
            "genreLabel" : genreLabel,
            "genreValueLabel" : genreValueLabel,
            "priceButton" : priceButton
            ]

        
//        detailView.layoutMargins = UIEdgeInsetsMake(20, 20, 20, 20)
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[nameLabel]-[artistLabel]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[nameLabel]-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[typeLabel]-[genreLabel]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[kindValueLabel]-[genreValueLabel]", options: [.alignAllLeading, .alignAllTrailing], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[typeLabel]-[kindValueLabel]-|", options: [.alignAllTop], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[imageView(100)]-[nameLabel]", options: [.alignAllCenterX], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[artistLabel]-[typeLabel]", options: [], metrics: nil, views: views)
        
        constraints += [
            detailView.widthAnchor.constraint(equalToConstant: 240.0),
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            closeButton.topAnchor.constraint(equalTo: detailView.layoutMarginsGuide.topAnchor),
            closeButton.leadingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.leadingAnchor),
            priceButton.bottomAnchor.constraint(equalTo: detailView.layoutMarginsGuide.bottomAnchor),
            priceButton.trailingAnchor.constraint(equalTo: detailView.layoutMarginsGuide.trailingAnchor),
            priceButton.topAnchor.constraint(equalTo: genreValueLabel.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
//
//
//        NSLayoutConstraint.activate([
//            //image view
//            imageView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 8),
//            imageView.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
//            imageView.widthAnchor.constraint(equalToConstant: 100),
//            imageView.heightAnchor.constraint(equalToConstant: 100),
//
//            //name label
//            nameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8 ),
//            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
//            nameLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
//
//            //artist label
//            artistLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            artistLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
//            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
//
//            //type label
//            typeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            typeLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 3),
//
//
//
//            //genre label
//            genreLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
//            genreLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 3),
//            genreLabel.trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor),
//
//
//            //price label
//            priceButton.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
//            priceButton.topAnchor.constraint(equalTo: genreValueLabel.bottomAnchor, constant: 8),
//            priceButton.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -4),
//
//            //close button
//            closeButton.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 4),
//            closeButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 2),
//            closeButton.heightAnchor.constraint(equalToConstant: 30),
//            closeButton.widthAnchor.constraint(equalToConstant: 30),
//
//            //kind value label
//            kindValueLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 16),
//            kindValueLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
//            kindValueLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 3),
//
//            //genre value label
//            genreValueLabel.leadingAnchor.constraint(equalTo: kindValueLabel.leadingAnchor),
//            genreValueLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
//            genreValueLabel.topAnchor.constraint(equalTo: kindValueLabel.bottomAnchor, constant: 3),
//        ])
    }
    
    func populateInformation() {
        nameLabel.text = searchResult.name
        artistLabel.text = searchResult.artistName
        typeLabel.text = "Type:"
        kindValueLabel.text = searchResult.type
        genreLabel.text = "Genre:"
        genreValueLabel.text = searchResult.genre
        priceButton.setTitle(searchResult.price != 0.0 ? "$" + String(searchResult.price) : "Free", for: .normal)
        
        if let largeURL = URL(string: searchResult.imageLarge) {
            downloadTask = imageView.loadImage(url: largeURL)
        }
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func openInStore() {
        if let url = URL(string: searchResult.storeURL) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        if touch?.view != detailView {
            close()
        }
    }
}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
