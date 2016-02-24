//
//  ViewController.m
//  UITextField
//
//  Created by n0rf3n on 24/02/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
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

- (IBAction)mostrarMensaje:(UIButton *)sender {
    
    //Variable de tipo String
    NSString *nombre = self.textField.text;
    
    //stringWithFormat => concatena String
    NSString *nombreCompleto  = [NSString stringWithFormat:@"Hola, %@!", nombre];
    
    //Se envia el texto al componente de tipo label
    [self.miEtiqueta setText:nombreCompleto];
}
@end
