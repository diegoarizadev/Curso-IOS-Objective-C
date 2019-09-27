//
//  ViewController.m
//  Conversor de unidades
//
//  Created by Antonio Cañas on 9/12/15.
//  Copyright © 2015 Antonio Cañas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    NSString *boxResult;
    NSString *actualNumber;
    BOOL result;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    result = false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)num:(UIButton *)sender {
        
    //Recojemos el valor introducido por el usuario en el campo
    NSString *currentValue = self.labelValue.text;
    
    if(result)
    {
        if([sender.titleLabel.text isEqual: @"."])
        {
            [self.labelValue setText:[NSString stringWithFormat:@"0%@", sender.titleLabel.text]];
            result = false;
        }
        else
        {
            [self.labelValue setText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
            result = false;
        }
    }
    else
    {
        if([self.labelValue.text isEqual: @"0"]){
            if([sender.titleLabel.text isEqual: @"."])
            {
                [self.labelValue setText:[NSString stringWithFormat:@"0%@", sender.titleLabel.text]];
                result = false;
            }
            else
            {
                [self.labelValue setText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
                result = false;
            }
        }
        else
        {
            NSString *concat = [NSString stringWithFormat:@"%@%@", currentValue, sender.titleLabel.text];
            [self.labelValue setText:concat];
        }
    }
    
}

- (IBAction)buttonDelete:(UIButton *)sender {
    
    actualNumber = @"";
    [self.labelValue setText:actualNumber];
    [self.labelResultadoConversion setText:actualNumber];
    
}

- (IBAction)buttonResult:(UIButton *)sender {
    

    
    [self.labelResultadoConversion setText:@"Hay que programar la conversión!"];

    
    result = true;
    
}


@end
