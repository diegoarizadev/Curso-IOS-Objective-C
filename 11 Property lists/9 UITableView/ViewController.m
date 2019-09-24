//
//  ViewController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/18/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "ViewController.h"
#import "PlanetCellTableView.h"

@interface ViewController ()

//Aqui se declaran variables unicamente para este view controler
{
    BOOL  planetasCheck[9]; // se debe instancias el tamaño del arreglo.
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.planetas =[@[@"Mercurio", @"Venus", @"La tierra",@"Júpiter", @"Urano", @"Saturno", @"Neptuno", @"Marte", @"La luna"] mutableCopy]; //es igual a => [NSArray Allow] init
    
    //al agregar mutableCopy se convierte un objecto que era estatico o no mutable.. a un objecto mutable o editable
    
    //Se crean los diccionarios
    self.imagesPlanetas = [@{@"Mercurio":@"mercurio",
                             @"Venus":@"venus",
                             @"La tierra":@"tierra",
                             @"Júpiter":@"jupiter",
                             @"Urano":@"urano",
                             @"Saturno":@"saturno",
                             @"Neptuno":@"neptuno",
                             @"Marte":@"marte",
                             @"La luna":@"luna"}mutableCopy]; //es igual a => [NSArray Allow] init
    
    
    
    self.descripcion =[@{@"Mercurio":@"El planeta más pequeño de todos",
                         @"Venus":@"Tamaño similiar al de la tierra",
                         @"La tierra":@"Unico planeta con vida",
                         @"La luna":@"Crateres visibles a simple vista",
                         @"Urano":@"los años duran el doble",
                         @"Saturno":@"Tine una tormenta siempre estacionaria",
                         @"Neptuno":@"Tiene anillos de gas y polvo",
                         @"Marte":@"Contiene mucho metano en su atmósfera",
                         @"Júpiter":@"El planeta más alejado del sol"
                         }mutableCopy];
    
    
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
    PlanetCellTableView * cell = (PlanetCellTableView*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier]; //aquí s recupera la celda.y modificar
    
    NSLog(@"N0rf3n - nombres : %@",self.planetas[indice]);
    
    cell.lblTitle.text = self.planetas[indice];
    
    cell.lblDescription.text = self.descripcion[self.planetas[indice]];
    
    NSLog(@"N0rf3n - imagenes : %@",self.imagesPlanetas[self.planetas[indice]]);
    //Se agrega una imagen a la celda
    cell.imgViewPlanet.image = [UIImage imageNamed:self.imagesPlanetas[self.planetas[indice]]];//agrega una imagen a la celda
    
    if (planetasCheck[indexPath.row]) {
      cell.accessoryType = UITableViewCellAccessoryCheckmark; //Con esto se agrega el Accesory type de leido.
    }else{
    cell.accessoryType = UITableViewCellAccessoryDetailButton; //Con esto se agrega el Accesory type de leido.
    }
    
    return cell;
}

#pragma mark - MEtodos del UITableVIewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{//Metodo para ajustar la altura de la celda.
    
    //Identificar el tamaño de la pantalla
    CGFloat altura = self.view.frame.size.height; //toda la zona que ocupa la vista.
    
    return altura/8.7;//el valor 8.35 es la cantidad de celdas que ahora se mostraran en la pantalla ""response""
}

//Obtener la seleccion de la tabla.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Se selecciona la fila %li",indexPath.row);
    
    
    UITableViewCell *celda = [tableView cellForRowAtIndexPath:indexPath];//Se recupera la celda seleccionada

    if (planetasCheck[indexPath.row]) {
        celda.accessoryType = UITableViewCellAccessoryDetailButton;
        planetasCheck[indexPath.row] = NO; //Se almacena en el arreglo la posición del arreglo en el cual el usuario ha leido el contenido.
    }else{
        
        [self showAlertWhitMessage:indexPath]; //Se llama a la función para mostrar el mensaje
        
        planetasCheck[indexPath.row] = YES; //Se almacena en el arreglo la posición del arreglo en el cual el usuario ha leido el contenido.
        celda.accessoryType = UITableViewCellAccessoryCheckmark; //Con esto se agrega el Accesory type de leido.
    }
}


-(void)showAlertWhitMessage:( NSIndexPath *)indexPath{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:self.planetas[indexPath.row]
                                                                   message:self.descripcion[self.planetas[indexPath.row]]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{ //indicara al usuario que se va a modificar una celda, cuando este metodo se ejecute por el delegado, se mostrar el icono de eliminar.
    
    NSString * planetaBorrado = self.planetas[indexPath.row];//obtiene la llave del diccionario
    [self.planetas removeObjectAtIndex:indexPath.row];
    [self.imagesPlanetas removeObjectForKey:planetaBorrado]; //metodo para elininar del diccionario
    [self.descripcion removeObjectForKey:planetaBorrado];
    
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; //se volver a cargar la tabla en la vista
    
}

    @end
