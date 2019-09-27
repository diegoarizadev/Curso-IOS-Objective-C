//
//  Divisa.h
//  Conversor de unidades
//
//  Created by Alejandro Ariza on 9/26/19.
//  Copyright © 2019 Antonio Cañas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKIT.h"


@interface Divisa : NSObject

@property (strong, nonatomic) NSString * nombre; //nombre de la divisa
@property (strong, nonatomic) UIImage * imagen; //imagen de la vidisa

//Constructor
-(id)initWhitName:(NSString*)nombre;
-(BOOL) isEqual:(id)object;//sobre escritura del metodo. 

@end

