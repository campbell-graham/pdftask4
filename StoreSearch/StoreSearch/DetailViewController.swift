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
    let priceLabel = UILabel()
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
        
        //background colours
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        detailView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.95)
        
        //add detail view to main view
        view.addSubview(detailView)
        
        //set up button
        closeButton.setTitle("X", for: .normal)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        closeButton.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        closeButton.layer.cornerRadius = 5
        
        //layout constraints for main view
        detailView.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            detailView.widthAnchor.constraint(equalToConstant: 240),
            detailView.heightAnchor.constraint(equalToConstant: 240),
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //add items to the detail view
        detailView.addSubview(closeButton)
        detailView.addSubview(imageView)
        detailView.addSubview(nameLabel)
        detailView.addSubview(artistLabel)
        detailView.addSubview(typeLabel)
        detailView.addSubview(kindValueLabel)
        detailView.addSubview(genreLabel)
        detailView.addSubview(genreValueLabel)
        detailView.addSubview(priceLabel)
        
        //layout constaints for detail view
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        kindValueLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreValueLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            //image view
            imageView.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: detailView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            //name label
            nameLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8 ),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            
            //artist label
            artistLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            artistLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            
            //type label
            typeLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            typeLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 3),
            
            //kind value label
            kindValueLabel.leadingAnchor.constraint(equalTo: typeLabel.trailingAnchor, constant: 16),
            kindValueLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 3),
            
            //genre label
            genreLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 8),
            genreLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 3),
            
            //genre value label
            genreValueLabel.leadingAnchor.constraint(equalTo: genreLabel.trailingAnchor, constant: 16),
            genreValueLabel.topAnchor.constraint(equalTo: kindValueLabel.bottomAnchor, constant: 3),
            
            //price label
            priceLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -8),
            priceLabel.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -8),
            
            //close button
            closeButton.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 4),
            closeButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 2)
        ])
        
        populateInformation()
    }
    
    func populateInformation() {
        nameLabel.text = searchResult.name
        artistLabel.text = searchResult.artistName
        typeLabel.text = "Type:"
        kindValueLabel.text = searchResult.type
        genreLabel.text = "Genre:"
        genreValueLabel.text = searchResult.genre
        priceLabel.text = String(searchResult.price)
        
        if let largeURL = URL(string: searchResult.imageLarge) {
            downloadTask = imageView.loadImage(url: largeURL)
        }
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
