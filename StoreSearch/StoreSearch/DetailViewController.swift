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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background colours
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        detailView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.95)
        
        //add to view
        view.addSubview(detailView)
        
        //layout constraints
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            detailView.widthAnchor.constraint(equalToConstant: 240),
            detailView.heightAnchor.constraint(equalToConstant: 240),
            detailView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
  

        // Do any additional setup after loading the view.
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
