//
//  ViewController.swift
//  23 AnimationHeaderWhatsApp
//
//  Created by Alejandro Ariza on 6/04/20.
//  Copyright © 2020 Alejandro Ariza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewHeader: UIView!
    
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ScrollViewHeightConstraint: NSLayoutConstraint!
    
    let headerViewMaxHeight: CGFloat = 44
    let headerViewMinHeight: CGFloat = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

       let y: CGFloat = scrollView.contentOffset.y

       let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y

       if newHeaderViewHeight > headerViewMaxHeight {
           headerViewHeightConstraint.constant = headerViewMaxHeight
       } else if newHeaderViewHeight < headerViewMinHeight {
           headerViewHeightConstraint.constant = headerViewMinHeight
       } else {

        let half: CGFloat = headerViewMaxHeight/2
        
           if(newHeaderViewHeight == headerViewMinHeight){

                UIView.animate(withDuration: 0.3) {
                    self.headerViewHeightConstraint.constant = 44
                    self.view.layoutIfNeeded()
                }
            }else if( newHeaderViewHeight <= half){

               UIView.animate(withDuration: 0.3) {
                   self.headerViewHeightConstraint.constant = 0
                   self.view.layoutIfNeeded()
               }
                       
            }else{
                
                headerViewHeightConstraint.constant = newHeaderViewHeight
                scrollView.contentOffset.y = 0 // block scroll view
            }

        
       }

    }
}



