//
//  CardViewController.swift
//  CardViewCustom
//
//  Created by Alejandro Ariza on 10/19/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

import UIKit

class  CardViewController: UIViewController {
    
    @IBOutlet weak var headerArea: UIView!
    
    @IBOutlet weak var SwipeUp: UIView!
    override func viewDidLoad() {
         super.viewDidLoad()
        self.view.layer.cornerRadius = 10 //al iniciar la interface redondea las esquinas.
        self.SwipeUp.layer.cornerRadius = 5;
     }
    
}
