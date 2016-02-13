//
//  ViewController.m
//  UIButton
//
//  Created by n0rf3n on 13/02/16.
//  Copyright © 2016 n0rf3n. All rights reserved.
//  Frist Class Objectve C
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
- (IBAction)UIButtonTest:(UIButton *)sender {
    
    //Creacion de la Alerta
    UIAlertController * alerta = [UIAlertController alertControllerWithTitle:@"Advertencia"                                     //Cabecera del mensaje
                                                                     message:@"Este mensaje hace parte de la acción del boton." //Cuerpo del mensaje
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
    
}
@end
