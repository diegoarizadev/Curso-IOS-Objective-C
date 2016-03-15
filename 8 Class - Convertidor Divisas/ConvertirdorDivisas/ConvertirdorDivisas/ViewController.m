//
//  ViewController.m
//  ConvertirdorDivisas
//
//  Created by n0rf3n on 14/03/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Constante para almacenar el dalor de conversión, dependiendo de los distintos casos 03/14/2016
const float pesoEuro = 0.000285616463;
const float pesoUSD = 0.000317;
const float pesoGbp = 0.000222089887;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnConvertir:(UIButton *)sender {
    
    
    /* Codigo no recursivo.
    float euro = [self.txtEuro.text floatValue]; //Captura del valor digitado por el usuario.
    
    float conversion = euro * euroDolar; //Operación de conversión.
    
    
    [self.lblResultado setText:[NSString stringWithFormat:@"Total de USD: %f", conversion]]; //Envio el texto al componente.
     */
    
    
    /*Resumiendo el codigo en una sola linea.*/
    [self.lblResultado setText:[NSString stringWithFormat:@"Total de €: %.2f", (pesoEuro*[self.txtEuro.text floatValue])]]; //Envio el texto al componente.
    self.lblResultado.hidden = NO;//desbloquear el componente.
    
}

- (IBAction)btnPesosUsd:(UIButton *)sender {
    

    //Creacion de la Alerta
    UIAlertController * alerta = [UIAlertController alertControllerWithTitle:@"Conversion"                                     //Cabecera del mensaje
                                                                     message:[NSString stringWithFormat:@"Total de USD %.2f", (pesoUSD*[self.txtEuro.text floatValue])] //Cuerpo del mensaje
                                                              preferredStyle:UIAlertControllerStyleAlert];                      //Estilo del boton.
    //Acción
    UIAlertAction * OKAccion = [UIAlertAction actionWithTitle:@"OK!"                                                            //Nombre del boton.
                                                        style:UIAlertActionStyleDefault                                         //Estilo del boton.
                                                      handler:nil];
    
    //Se agrega la acción a la alerta
    [alerta addAction:OKAccion];                                                                                                //La alerta Ejecute la acción.
    
    //Se muestra la Alerta
    [self presentViewController:alerta                                                                                          //Self "yo mismo" presentara en la misma pantalla de ejecución.
                       animated:YES                                                                                             //Animara la acción
                     completion:nil ];
    
    
    [self.lblResultado setText:[NSString stringWithFormat:@"Total de USD %.2f", (pesoUSD*[self.txtEuro.text floatValue])]]; //Envio el texto al componente.
    self.lblResultado.hidden = NO;//desbloquear el componente.
    
}

- (IBAction)btnPesosLibras:(UIButton *)sender {
    
    
    [self.lblResultado setText:[NSString stringWithFormat:@"Total de GBP %.2f", (pesoGbp*[self.txtEuro.text floatValue])]]; //Envio el texto al componente.
    self.lblResultado.hidden = NO;//desbloquear el componente.
    
}
@end
