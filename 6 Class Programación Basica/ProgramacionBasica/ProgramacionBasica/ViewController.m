//
//  ViewController.m
//  ProgramacionBasica
//
//  Created by n0rf3n on 5/03/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Metodo para cargar la vista inicial en el dispositivo.
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Declaración de variables enteras.
    int x = 5;
    int y = -3;
    
    //x=2; //Reasignacion de variable.
    
    int radioObjeto = 6738;
    
    
    //Float (decimales) precision de 8 decimales exacta. si se necesitan mas decimales se esa double.
    
    float division = ((1.0*x)/(1.0*y)); //Se multiplica x 1.0 las variables X y Y para convertirlas en float.
    float xFloat=1.00000;
    double xDouble = 1.00000000000;
    
    
    //Impresión de variables por consola.
    NSLog(@"El valor del entero x es       => %d",x);
    NSLog(@"El valor del entero y es       => %d",y);
    NSLog(@"El valor de un objecto es      => %d",radioObjeto);
    NSLog(@"El valor de la división es     => %f",division);
    NSLog(@"El valor del float, xFloat es  => %f",xFloat);
    NSLog(@"El valor del float, xDouble es => %f",xDouble);
    
}


//Metodo para controlar el estress del dispositivo.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
