//
//  Exchange.h
//  Conversor de unidades
//
//  Created by Alejandro Ariza on 10/1/19.
//  Copyright © 2019 Antonio Cañas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Divisa.h"



@interface Exchange : NSObject

//funcion para convertir el valor "Value" de divisa "firtsDivisa" a divisa "lastDivisa"
+(float) changeCurrency:(Divisa *) firtsDivisa for:(Divisa *) lastDivisa currencyValue:(float) value;

@end

