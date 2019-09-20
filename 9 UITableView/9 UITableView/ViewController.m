//
//  ViewController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/18/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.planetas = @[@"Mercurio", @"Venus", @"La tierra",@"Júpiter", @"Urano", @"Saturno", @"Neptuno", @"Marte", @"La luna"]; //es igual a => [NSArray Allow] init
    
    //arreglo con el nombre de las imagenes,
    self.imagesPlanetas = @[@"mercurio ", @"venus", @"tierra", @"jupiter", @"urano", @"saturno", @"neptuno", @"marte", @"luna"]; //es igual a => [NSArray Allow] init
}


//-Begin implementación  UITableViewDataSource

#pragma mark - Metodos del UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ //definira el numero de filas que contendra la tabla.
    
    return self.planetas.count;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { //Se llama cada vez que se debe mostrar una celda, REtorna lo que se encuentre en cada posición seleccionada
    
    //en este metodo se puede acceder a dos variables ROW y SECTION con estas variables se identifica en que sección y esta y que fila se esta moviendo el usuario.
    
    NSInteger indice  = indexPath.row; //Se la posicion del planeta
 
    //se instancia estatico ya que las celdas se vna a reutilizar, estzs variable se utilizara en todo el hilo de la App
    static NSString * cellIdentifier = @"PlanetCell"; //Es un identificador estatico que no va a cambiar y hace referencia a la celda o ID de celda
    
    //Se utiliza para recuperar una tabla que se reutilizara del propio del UITableView
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier]; //aquí s recupera la celda.y modificar
    
    NSLog(@"N0rf3n - nombres : %@",self.planetas[indice]);
    
    cell.textLabel.text = self.planetas[indice];
    
    NSLog(@"N0rf3n - imagenes : %@",self.imagesPlanetas[indice]);
    //Se agrega una imagen a la celda
    cell.imageView.image = [UIImage imageNamed:self.imagesPlanetas[indice]];//agrega una imagen a la celda
    
    return cell;
}

    @end
