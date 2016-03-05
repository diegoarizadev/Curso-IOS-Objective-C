//
//  ViewController.h
//  Convertirdor
//
//  Created by n0rf3n on 5/03/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *lblKm;

@property (strong, nonatomic) IBOutlet UILabel *lblResultado;

- (IBAction)btnConvertir:(UIButton *)sender;

//Funcion Custom para realizar la conversion
- (float)fxConvertir:(float)km;

@end

