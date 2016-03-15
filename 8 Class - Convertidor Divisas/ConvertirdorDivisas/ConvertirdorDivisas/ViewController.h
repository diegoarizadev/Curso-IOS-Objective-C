//
//  ViewController.h
//  ConvertirdorDivisas
//
//  Created by n0rf3n on 14/03/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txtEuro;

@property (strong, nonatomic) IBOutlet UILabel *lblResultado;


- (IBAction)btnConvertir:(UIButton *)sender;

- (IBAction)btnPesosUsd:(UIButton *)sender;

- (IBAction)btnPesosLibras:(UIButton *)sender;
@end

