//
//  LandscapeViewController.swift
//  StoreSearch
//
//  Created by Campbell Graham on 22/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import UIKit

class LandscapeViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        pageControl.numberOfPages = 3
        
        //add items to view
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        //layout constraints
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
                //page control
                pageControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                pageControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

                //scroll view
                scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
