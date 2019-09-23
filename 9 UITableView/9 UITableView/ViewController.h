//
//  ViewController.h
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/18/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> //los obejctos entre los <> son delegados.

/*
 Cuando se coloca una tabla se deben poner dos delegados.
 
 UITableViewDataSource = Como se transmiten los datos del modelo a la tabla.
 UITableViewDelegate = Se encarga de la aparecian, del como se debe mostrar y como interactuar.
 */

//Los delegados detectan los cambios en la vista o el data source
//UITableViewDataSource esta es la unión entre los datos y la tabla.
//UITableViewDelegate se encarga de como mostrar los datos en la tabla, no por ejemplo, este delago permite, cambiar las dimensiones, agregar footer y demas,

@property(strong, nonatomic)NSArray * planetas; //Se declara el arreglo globarl e inmutable, 
@property(strong, nonatomic)NSArray * imagesPlanetas; //Se declara el arreglo globarl e inmutable,
@property(strong, nonatomic)NSArray * descripcion;



@end

