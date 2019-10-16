//
//  PlanetCollectionViewController.m
//  PlanetCollections
//
//  Created by Alejandro Ariza on 10/15/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "PlanetCollectionViewController.h"
#import "Planet.h"
#import "PlanetCollectionViewCell.h"

@interface PlanetCollectionViewController ()

@end

@implementation PlanetCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

NSArray *planets;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Descomente la siguiente línea para preservar la selección entre las presentaciones
    // self.clearsSelectionOnViewWillAppear = NO;
    
    Planet *planet1 = [Planet new];
    planet1.nombre = @"Mercurio";
    planet1.nombreImagen = @"mercurio";
    planet1.descripcion = @"El planeta más pequeño de todos";
    
    Planet *planet2 = [Planet new];
    planet2.nombre = @"Venus";
    planet2.nombreImagen = @"venus";
    planet2.descripcion = @"Tamaño similar a la tierra";
    

    Planet *planet3 = [Planet new];
    planet3.nombre = @"La Tierra";
    planet3.nombreImagen = @"tierra";
    planet3.descripcion = @"El único planeta con vida (de momento)";
    
    
    Planet *planet4 = [Planet new];
    planet4.nombre = @"La Luna";
    planet4.nombreImagen = @"luna";
    planet4.descripcion = @"Tiene cráteres visibles a simple vista";
    
    Planet *planet5 = [Planet new];
    planet5.nombre = @"Marte";
    planet5.nombreImagen = @"marte";
    planet5.descripcion = @"Los años duran el doble";
    
    Planet *planet6 = [Planet new];
    planet6.nombre = @"Júpiter";
    planet6.nombreImagen = @"jupiter";
    planet6.descripcion = @"Tiene una tormenta siempre estacionaria";
    
    Planet *planet7 = [Planet new];
    planet7.nombre = @"Saturno";
    planet7.nombreImagen = @"saturno";
    planet7.descripcion = @"Tiene anillos de gas y polvo";
    
    
    Planet *planet8 = [Planet new];
    planet8.nombre = @"Urano";
    planet8.nombreImagen = @"urano";
    planet8.descripcion = @"Contiene mucho metano en su atmósfera";
    
    
    Planet *planet9 = [Planet new];
    planet9.nombre = @"Neptuno";
    planet9.nombreImagen = @"neptuno";
    planet9.descripcion = @"El planeta más alejado del Sol";
    
    
    Planet *planet10 = [Planet new];
    planet10.nombre = @"Plutón";
    planet10.nombreImagen = @"tierra";
    planet10.descripcion = @"El antiguo planeta que ya no lo es";
    
    
    planets = [[NSArray arrayWithObjects:planet1, planet2, planet3, planet4, planet5,
               planet6, planet7, planet8, planet9, planet10, nil] mutableCopy];
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //  Realice cualquier configuración adicional después de cargar la vista.
}

/*
#pragma mark - Navigation

// En una aplicación basada en storyboard, a menudo querrá hacer una pequeña preparación antes de la navegación
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Obtenga el nuevo controlador de vista usando [segue destinationViewController].
    // Pasar el objeto seleccionado al nuevo controlador de vista.
}
*/

#pragma mark Metodos del DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1; //Secciones a implementar.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return planets.count;//numero de celdas a dibujar.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configurar la celda
    
    PlanetCollectionViewCell * cell = (PlanetCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    Planet * planet = planets[indexPath.row];
    
    cell.planetImageView.image = [UIImage imageNamed:planet.nombreImagen];
    
    return cell;
}

#pragma mark Metodos del delegado Delegate

/*
// Descomente este método para especificar si el elemento especificado debe resaltarse durante el seguimiento
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Descomente este método para especificar si se debe seleccionar el elemento especificado.
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Descomente estos métodos para especificar si se debe mostrar un menú de acción para el elemento especificado y reaccionar ante las acciones realizadas en el elemento.
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
