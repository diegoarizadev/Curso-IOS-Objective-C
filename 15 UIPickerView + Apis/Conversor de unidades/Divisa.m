//
//  Divisa.m
//  Conversor de unidades
//
//  Created by Alejandro Ariza on 9/26/19.
//  Copyright © 2019 Antonio Cañas. All rights reserved.
//

#import "Divisa.h"

@implementation Divisa


//Constructor
-(id)initWhitName:(NSString*)nombre{
    
    //Evita errores, cuando la clase no se instancia
    if(self = [super init]){
        
        self.nombre = nombre;
        self.imagen = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",nombre]];
        
    }
    
    return self;
    
}

//sobre escritura del metodo.
-(BOOL) isEqual:(Divisa*)object{
    
    if (object!=nil && [self.nombre isEqualToString:object.nombre]) {
        return YES;
    }
    
    return NO;
}

@end
