//
//  CustomPlanetTabletViewController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/19/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "CustomPlanetTabletViewController.h"

@interface CustomPlanetTabletViewController ()

@end

@implementation CustomPlanetTabletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.planetas = @[@"Mercurio", @"Venus", @"La tierra",@"Júpiter", @"Urano", @"Saturno", @"Neptuno", @"Marte", @"La luna"]; //es igual a => [NSArray Allow] init
    
    //arreglo con el nombre de las imagenes,
    self.imagesPlanetas = @[@"mercurio", @"venus", @"tierra", @"jupiter", @"urano", @"saturno", @"neptuno", @"marte", @"luna"]; //es igual a => [NSArray Allow] init
}



//Se esconde la barra
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
