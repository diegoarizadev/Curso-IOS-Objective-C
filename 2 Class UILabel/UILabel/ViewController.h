//
//  ViewController.h
//  UILabel
//
//  Created by n0rf3n on 13/02/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)UIButtonProbar:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *LabelView;
//Nonatomic solo habra un solo objeto en el hilo de ejecución.
//EL label quedo registrado como una propiedad.

@end

