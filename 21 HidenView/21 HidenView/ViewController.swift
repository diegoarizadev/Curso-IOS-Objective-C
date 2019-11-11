//
//  ViewController.swift
//  21 HidenView
//
//  Created by Alejandro Ariza on 11/11/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnEsconder: UIButton!
    
    @IBOutlet weak var test1: NSLayoutConstraint!
    @IBOutlet weak var Viewblue: UIView!
    @IBOutlet weak var ViewOrange: UIView!
    @IBOutlet weak var ViewGreen: UIView!
    
  
    @IBAction func Btnhidden(_ sender: Any) {
        if (ViewOrange.isHidden) {
            NSLog("N0rf3nm1");
            //ViewOrange.isHidden = false;
            //test1.constant = 223;
       
            
            self .setView(view: ViewOrange, hidden: false, state:223, alfaEfect: 1);

        }else{
             NSLog("N0rf3nm2");
            //ViewOrange.isHidden = true;
            //test1.constant = 0;
            
            self .setView(view: ViewOrange, hidden: true, state:0, alfaEfect:0.0);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setView(view: UIView, hidden: Bool, state: CGFloat, alfaEfect: CGFloat) {
       /*( UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
            self.test1.constant = state
            view.alpha = alfaEfect
        })
        */
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionCrossDissolve , animations: {
            view.isHidden = hidden
            self.test1.constant = state
            view.alpha = alfaEfect
        })
    }

 
}

