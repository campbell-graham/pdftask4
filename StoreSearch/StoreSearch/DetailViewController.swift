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
    let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background colours
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        detailView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.95)
        
        //add detail view to main view
        view.addSubview(detailView)
        
        //set up button
        closeButton.setTitle("Close", for: .normal)
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        closeButton.setTitleColor(UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1), for: .normal)
        
        //layout constraints
        detailView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailView.widthAnchor.constraint(equalToConstant: 240),
            detailView.heightAnchor.constraint(equalToConstant: 240),
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //add button to detail view
        detailView.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 4),
            closeButton.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 2)
        ])
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
