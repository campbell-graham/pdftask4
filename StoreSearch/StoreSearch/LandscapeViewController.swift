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
    var searchResults = [SearchResult]()
    private var firstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        //page view setup
        pageControl.numberOfPages = 0
        pageControl.addTarget(self, action: #selector(pageChanged(_:)), for: .valueChanged)
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        pageControl.currentPageIndicatorTintColor = UIColor(red: 10/255, green: 80/255, blue: 80/255, alpha: 1)
        
        //scroll view setup
        scrollView.backgroundColor = #colorLiteral(red: 0.8542988579, green: 0.8542988579, blue: 0.8542988579, alpha: 1)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
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
    }
    
    override func viewDidLayoutSubviews() {
        if firstTime {
            firstTime = false
            tileButtons(searchResults)
        }
    }
    
    private func tileButtons(_ searchResults: [SearchResult]) {
        var columnsPerPage = 5
        var rowsPerPage = 3
        var itemWidth: CGFloat = 96
        var itemHeight: CGFloat = 88
        var marginX: CGFloat = 0
        var marginY: CGFloat = 20
        let viewWidth = scrollView.bounds.size.width
        switch viewWidth {
        case 568:
            columnsPerPage = 6
            itemWidth = 94
            marginX = 2
        case 667:
            columnsPerPage = 7
            itemWidth = 95
            itemHeight = 98
            marginX = 1
            marginY = 29
        case 736:
            columnsPerPage = 8
            rowsPerPage = 4
            itemWidth = 92
        default:
            break
        }
        
        let buttonWidth: CGFloat = 82
        let buttonHeight: CGFloat = 82
        let paddingHorz = (itemWidth - buttonWidth)/2
        let paddingVert = (itemHeight - buttonHeight)/2
        
        var row = 0
        var column = 0
        var x = marginX
        
        for (result) in searchResults {
            // 1
            let button = UIButton(type: .custom)
            button.layer.cornerRadius = 15
            button.backgroundColor = #colorLiteral(red: 0.1636788168, green: 0.1772186318, blue: 0.1968886197, alpha: 1)
            downloadImage(for: result, andPlaceOn: button)
            button.frame = CGRect(x: x + paddingHorz,
                                  y: marginY + CGFloat(row)*itemHeight + paddingVert,
                                  width: buttonWidth, height: buttonHeight)
            // 3
            scrollView.addSubview(button)
            // 4
            row += 1
            if row == rowsPerPage {
                row = 0; x += itemWidth; column += 1
                if column == columnsPerPage {
                    column = 0; x += marginX * 2
                }
            }
        }
        
        let buttonsPerPage = columnsPerPage * rowsPerPage
        let numPages = 1 + (searchResults.count - 1) / buttonsPerPage
        scrollView.contentSize = CGSize(
            width: CGFloat(numPages) * scrollView.bounds.width,
            height: scrollView.bounds.height)
        pageControl.numberOfPages = numPages
        pageControl.currentPage = 0
    }
    
    @objc func pageChanged(_ sender: UIPageControl) {
        scrollView.contentOffset = CGPoint(
            x: scrollView.bounds.size.width * CGFloat(sender.currentPage), y: 0)
    }
    
    private func downloadImage(for searchResult: SearchResult,
                               andPlaceOn button: UIButton) {
        if let url = URL(string: searchResult.imageSmall) {
            let task = URLSession.shared.downloadTask(with: url) {
                [weak button] url, response, error in
                if error == nil, let url = url,
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if let button = button {
                            button.setImage(image, for: .normal)
                        }
                    } }
            }
            task.resume()
        }
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

extension LandscapeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        let page = Int((scrollView.contentOffset.x + width / 2) / width)
        pageControl.currentPage = page
    }
}
