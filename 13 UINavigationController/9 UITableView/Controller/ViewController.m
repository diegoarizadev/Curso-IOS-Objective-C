//
//  ViewController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/18/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "ViewController.h"
#import "PlanetCellTableView.h"
#import "Planeta.h"
#import "DetailViewController.h"

@interface ViewController ()

//Aqui se declaran variables unicamente para este view controler
{
    BOOL  planetasCheck[9]; // se debe instancias el tamaño del arreglo.
    //2. crear el objecto privado para la clase.
    NSMutableArray * planetas;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"planetas" ofType:@"plist"]; //ubica el recurso del plist
    NSLog(@"N0rf3n la ruta es : %@ ", path);
    
    Planeta * mercurio    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    mercurio.nombre       = @"Mercurio";
    mercurio.nombreImagen = @"mercurio";
    mercurio.descripcion  = @"El planeta más peuqeño de todos.";
    
    Planeta * venus    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    venus.nombre       = @"Venus";
    venus.nombreImagen = @"venus";
    venus.descripcion  = @"Tamaño similar al de la tierra.";
    
    Planeta * tierra    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    tierra.nombre       = @"La tierra";
    tierra.nombreImagen = @"tierra";
    tierra.descripcion  = @"El único planeta con vida.";
    
    Planeta * luna    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    luna.nombre       = @"La luna";
    luna.nombreImagen = @"luna";
    luna.descripcion  = @"Tiene cráteres visibles a simple vista.";
    
    Planeta * marte    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    marte.nombre       = @"Marte";
    marte.nombreImagen = @"marte";
    marte.descripcion  = @"El plameta rojo del sistema y los años duran el doble.";
    
    Planeta * jupiter    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    jupiter.nombre       = @"Júpìter";
    jupiter.nombreImagen = @"jupiter";
    jupiter.descripcion  = @"Tiene una tormenta simpre estacionaria.";
    
    Planeta * saturno    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    saturno.nombre       = @"Saturno";
    saturno.nombreImagen = @"saturno";
    saturno.descripcion  = @"Tiene anillos de gas y polvo.";
    
    Planeta * urano    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    urano.nombre       = @"Urano";
    urano.nombreImagen = @"urano";
    urano.descripcion  = @"Contiene mucho metano en su atmosfera";
    
    Planeta * neptuno    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    neptuno.nombre       = @"Neptuno";
    neptuno.nombreImagen = @"neptuno";
    neptuno.descripcion  = @"el planeta mas alejado del sol";
    
    Planeta * pluton    = [Planeta new]; //3. inicializar el objecto., [Planeta new]; es lo mismo que [[Planeta alloc] init];
    pluton.nombre       = @"Plutón";
    pluton.nombreImagen = @"tierra";
    pluton.descripcion  = @"El antiguo planeta que ya no lo es.";
    
    
    //ahora se debe crear el arreglo mutable.
    
    planetas = [[NSArray arrayWithObjects:mercurio,venus,tierra,luna,marte,jupiter,saturno,urano,neptuno,pluton, nil] mutableCopy];


}


//-Begin implementación  UITableViewDataSource

#pragma mark - Metodos del UITableViewDataSource
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ //definira el numero de filas que contendra la tabla.
    
    return [planetas count];

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { //Se llama cada vez que se debe mostrar una celda, REtorna lo que se encuentre en cada posición seleccionada
    
    //en este metodo se puede acceder a dos variables ROW y SECTION con estas variables se identifica en que sección y esta y que fila se esta moviendo el usuario.
    
    NSInteger indice  = indexPath.row; //Se la posicion del planeta
 
    //se instancia estatico ya que las celdas se vna a reutilizar, estzs variable se utilizara en todo el hilo de la App
    static NSString * cellIdentifier = @"PlanetCell"; //Es un identificador estatico que no va a cambiar y hace referencia a la celda o ID de celda
    
    Planeta * currentPlanet = planetas[indice]; //Recupera el planeta con el cual se va a trabajar
    
    //Se utiliza para recuperar una tabla que se reutilizara del propio del UITableView
    PlanetCellTableView * cell = (PlanetCellTableView*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier]; //aquí s recupera la celda.y modificar
    
    NSLog(@"N0rf3n - nombre : %@", currentPlanet.nombre);
    
    cell.lblTitle.text = currentPlanet.nombre;

    NSLog(@"N0rf3n - descripcion : %@",currentPlanet.descripcion);
    
    cell.lblDescription.text = currentPlanet.descripcion;
    
    NSLog(@"N0rf3n - imagenes : %@",currentPlanet.nombreImagen);
    //Se agrega una imagen a la celda
    cell.imgViewPlanet.image = [UIImage imageNamed:currentPlanet.nombreImagen];//agrega una imagen a la celda
    
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
    
    Planeta * currentPlanet = planetas[indexPath.row]; //Recupera el planeta con el cual se va a trabajar
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:currentPlanet.nombre
                                                                   message:currentPlanet.descripcion
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{ //indicara al usuario que se va a modificar una celda, cuando este metodo se ejecute por el delegado, se mostrar el icono de eliminar.
    
    [planetas removeObjectAtIndex:indexPath.row];

    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade]; //se volver a cargar la tabla en la vista
    
    
}

//Como se esta pasando de información de una pantalla a otra, es necesario pasar la información de un ViewController a otro con un segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    //si se tiene n Segues con una estructura de IF se podran controlar las acciones para cada uno.
    if ([segue.identifier isEqualToString:@"seguePlaneta"]) {
        NSIndexPath * indexPlaneta = [self.tablaPlanetas indexPathForSelectedRow]; //Se recupera el indexPath de la seleccion de la tabla
        Planeta * planetaSegue = planetas[indexPlaneta.row]; //Se captura el planeta seleccionado
        
        //ahora se debe enviar la información al Destinatario o Viewcontroller del detalle.
        DetailViewController *dvc = segue.destinationViewController;
        dvc.planeta = planetaSegue; //Se le envia el objecto al viewcontroller.
    }
    
}

    @end
