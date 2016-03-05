//
//  ViewController.h
//  UITextField
//
//  Created by n0rf3n on 24/02/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)mostrarMensaje:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *miEtiqueta;
  

@end

