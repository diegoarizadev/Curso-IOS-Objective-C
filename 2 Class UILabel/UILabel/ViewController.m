//
//  ViewController.m
//  UILabel
//
//  Created by n0rf3n on 13/02/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//  Second Class Objectve C
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    //Metodo para la acción que ejecutara el boton agregadp en Main.storyboard.
- (IBAction)UIButtonProbar:(UIButton *)sender {
    
    //Opcion para enviar el mensaje al componente UILabel de Main.storyboard.
    [self.LabelView setText:@"Eres un usuario rebelde..! Este es el mensaje enviado al UILabel." ];
    
}
@end
