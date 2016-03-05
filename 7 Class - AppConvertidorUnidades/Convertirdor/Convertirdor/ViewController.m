//
//  ViewController.m
//  Convertirdor
//
//  Created by n0rf3n on 5/03/16.
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

- (IBAction)btnConvertir:(UIButton *)sender {
    
    float resultado = 0.0;
    
    //Capturar el valor del controler view
    float km = [self.lblKm.text floatValue]; //Captura el valor y lo convierte a float.
    
    //Impresion por consola.
    NSLog(@"###### btnConvertir, Valor Capturado es =>  %f ", km);
    
    //Llamado a la función custom para realizar la conversión.
    resultado = [self fxConvertir:km];
    
    //Impresion por consola.
    NSLog(@"###### btnConvertir, retornado de la función es %f ", resultado);
    
    //Envio el texto al componente.
    [self.lblResultado setText:[NSString stringWithFormat:@"El resultado es: %f Millas", resultado]];
    
}

//Funcion Custom para realizar la conversion de km a millas.
- (float)fxConvertir:(float)km{
    
    float resultado = 0.0;
    float milla = 1.609; //Una milla en km es igual a 1.609
    
    //Si los km ingresados son diferentes de 0.0
    if ( km != 0.0 ) {
        
        resultado = (km)/milla;
        
        //Impresion por consola.
        NSLog(@"###### fxConvertir, El resultado de la conversion es %f ", resultado);

        //retorno de la función.
        return resultado;
        
    }else{ //i el valor es igual a 0.0
        
        //Impresion por consola.
        NSLog(@"###### fxConvertir, La variable km = %f esta vacia o es nula..!! ", km);
        
        //retorno de la función.
        return km;
        
    }
    
    return resultado;
    
}


@end
