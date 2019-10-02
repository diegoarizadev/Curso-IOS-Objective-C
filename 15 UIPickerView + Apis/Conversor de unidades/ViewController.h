//
//  ViewController.h
//  Conversor de unidades
//
//  Created by Antonio Cañas on 9/12/15.
//  Copyright © 2015 Antonio Cañas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UILabel *labelValue;

@property (strong, nonatomic) IBOutlet UILabel *labelResultadoConversion;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerSelect;

/*** Buttons numbers ***/

- (IBAction)num:(UIButton *)sender;

- (IBAction)buttonDelete:(UIButton *)sender;

/*** Buttons calculate ***/

- (IBAction)buttonResult:(UIButton *)sender;


@end

