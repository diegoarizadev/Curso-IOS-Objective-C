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
    
    self.planetas = @[@"Mercurio", @"Venus", @"La tierra",@"Júpiter", @"Urano", @"Saturno", @"Neptuno", @"Marte", @"La luna"]; //es igual a => [NSArray Allow] init
    
    //arreglo con el nombre de las imagenes,
    self.imagesPlanetas = @[@"mercurio", @"venus", @"tierra", @"jupiter", @"urano", @"saturno", @"neptuno", @"marte", @"luna"]; //es igual a => [NSArray Allow] init
    
    
    self.descripcion = @[@"Mercurio es el planeta del sistema solar más próximo al Sol y el más pequeño. Forma parte de los denominados planetas interiores o terrestres y carece de satélites naturales al igual que Venus. Se conocía muy poco sobre su superficie hasta que fue enviada la sonda planetaria Mariner 10 y se hicieron observaciones con radar y radiotelescopios.", @"Venus es el segundo planeta del sistema solar en orden de distancia desde el Sol, el sexto en cuanto a tamaño, ordenados de mayor a menor. Al igual que Mercurio, carece de satélites naturales. Recibe su nombre en honor a Venus, la diosa romana del amor (gr. Afrodita). Se trata de un planeta de tipo rocoso y terrestre, llamado con frecuencia el planeta hermano de la Tierra, ya que ambos son similares en cuanto a tamaño, masa y composición, aunque totalmente diferentes en cuestiones térmicas y atmosféricas (la temperatura media de Venus es de 463,85 ºC). Su órbita es una elipse con una excentricidad de menos del 1%, formando la órbita más circular de las de todos los planetas; apenas supera la de Neptuno. Su presión atmosférica es 90 veces superior a la terrestre; es, por tanto, la mayor presión atmosférica de las de todos los planetas rocosos del sistema solar.", @"La Tierra se formó hace aproximadamente 4550 millones de años y la vida surgió unos mil millones de años después.18​ Es el hogar de millones de especies, incluyendo los seres humanos y actualmente el único cuerpo astronómico donde se conoce la existencia de vida.19​ La atmósfera y otras condiciones abióticas han sido alteradas significativamente por la biosfera del planeta, favoreciendo la proliferación de organismos aerobios, así como la formación de una capa de ozono que junto con el campo magnético terrestre bloquean la radiación solar dañina, permitiendo así la vida en la Tierra.20​ Las propiedades físicas de la Tierra, la historia geológica y su órbita han permitido que la vida siga existiendo. Se estima que el planeta seguirá siendo capaz de sustentar vida durante otros 500 millones de años, ya que según las previsiones actuales, pasado ese tiempo la creciente luminosidad del Sol terminará causando la extinción de la biosfera.21​22​23​", @"Júpiter es el quinto planeta del sistema solar. Forma parte de los denominados planetas exteriores o gaseosos. Recibe su nombre del dios romano Júpiter (Zeus en la mitología griega).", @"Urano es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo. Se llama así en honor de la divinidad griega del cielo Urano (del griego antiguo «Οὐρανός»), el padre de Crono (Saturno) y el abuelo de Zeus (Júpiter). Aunque es detectable a simple vista en el cielo nocturno, no fue catalogado como planeta por los astrónomos de la antigüedad debido a su escasa luminosidad y a la lentitud de su órbita.13​ Sir William Herschel anunció su descubrimiento el 13 de marzo de 1781, ampliando las fronteras entonces conocidas del sistema solar, por primera vez en la historia moderna. Urano es también el primer planeta descubierto por medio de un telescopio.", @"Saturno es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa después de Júpiter y el único con un sistema de anillos visible desde la Tierra. Su nombre proviene del dios romano Saturno. Forma parte de los denominados planetas exteriores o gaseosos. El aspecto más característico de Saturno son sus brillantes anillos. Antes de la invención del telescopio, Saturno era el más lejano de los planetas conocidos y, a simple vista, no parecía luminoso ni interesante. El primero en observar los anillos fue Galileo en 1610,1​ pero la baja inclinación de los anillos y la baja resolución de su telescopio le hicieron pensar en un principio que se trataba de grandes lunas. Christiaan Huygens, con mejores medios de observación, pudo en 1659 observar con claridad los anillos. James Clerk Maxwell, en 1859, demostró matemáticamente que los anillos no podían ser un único objeto sólido sino que debían ser la agrupación de millones de partículas de menor tamaño. Las partículas que componen los anillos de Saturno giran a una velocidad de 48 000 km/h, 15 veces más rápido que una bala.", @"Neptuno es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores o gigantes gaseosos, y es el primero que fue descubierto gracias a predicciones matemáticas. Su nombre fue puesto en honor al dios romano del mar —Neptuno—, y es el cuarto planeta en diámetro y el tercero más grande en masa. Su masa es diecisiete veces la de la Tierra y ligeramente mayor que la de su planeta «gemelo» Urano, que tiene quince masas terrestres y no es tan denso. En promedio, Neptuno orbita el Sol a una distancia de 30,1 ua. Su símbolo astronómico es ♆, una versión estilizada del tridente del dios Neptuno", @"Marte es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio. Recibió su nombre en homenaje al dios de la guerra de la mitología romana (Ares en la mitología griega), y también es conocido como el planeta rojo3​ 4​ debido a la apariencia rojiza5​ que le confiere el óxido de hierro predominante en su superficie. Marte es el planeta interior más alejado del Sol. Es un planeta telúrico con una atmósfera delgada de dióxido de carbono, y posee dos satélites pequeños y de forma irregular, Fobos y Deimos (hijos del dios griego), que podrían ser asteroides capturados6​7​ similares al asteroide troyano (5261) Eureka. Sus características superficiales recuerdan tanto a los cráteres de la Luna como a los valles, desiertos y casquetes polares de la Tierra.", @"La Luna es el único satélite natural de la Tierra. Con un diámetro ecuatorial de 3474 km, es el quinto satélite más grande del sistema solar, mientras que en cuanto al tamaño proporcional respecto a su planeta es el satélite más grande: un cuarto del diámetro de la Tierra y 1/81 de su masa. Después de Ío, es además el segundo satélite más denso. Se encuentra en relación síncrona con la Tierra, siempre mostrando la misma cara hacia el planeta. El hemisferio visible está marcado con oscuros mares lunares de origen volcánico entre las brillantes montañas antiguas y los destacados astroblemas."]; //es igual a => [NSArray Allow] init
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
    
    cell.lblDescription.text = self.descripcion[indice];
    
    NSLog(@"N0rf3n - imagenes : %@",self.imagesPlanetas[indice]);
    //Se agrega una imagen a la celda
    cell.imgViewPlanet.image = [UIImage imageNamed:self.imagesPlanetas[indice]];//agrega una imagen a la celda
    
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
                                                                   message:self.descripcion[indexPath.row]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

    @end
