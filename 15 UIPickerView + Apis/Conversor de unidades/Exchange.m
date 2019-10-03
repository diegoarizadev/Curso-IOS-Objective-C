//
//  Exchange.m
//  Conversor de unidades
//
//  Created by Alejandro Ariza on 10/1/19.
//  Copyright © 2019 Antonio Cañas. All rights reserved.
//

#import "Exchange.h"

@implementation Exchange

//funcion para convertir el valor "Value" de divisa "firtsDivisa" a divisa "lastDivisa"
+(float) changeCurrency:(Divisa *) firtsDivisa for:(Divisa *) lastDivisa currencyValue:(float) value{

    NSString *  KeyApi = @"2425|GpFYeQxF5Ar9RXnjsv*jwbpnNJT6FnOc";
    
    NSLog(@"N0rf3n - changeCurrency - firtsDivisa : %@",firtsDivisa.nombre);
    NSLog(@"N0rf3n - changeCurrency - lastDivisa : %@",lastDivisa.nombre);
    NSLog(@"N0rf3n - changeCurrency - value : %f",value);
    
    if ([firtsDivisa isEqual:lastDivisa]) {
        NSLog(@"N0rf3n - changeCurrency - Divisas Iguales");
        return value;
        
    }else{
        
        NSLog(@"N0rf3n - changeCurrency - Divisas !=");
        
        if ([self checkInternet]) { //si tiene internet.
            //Crear URL
            NSString * urlString = [NSString stringWithFormat:@"https://api.cambio.today/v1/full/%@/json?key=%@",firtsDivisa.nombre, KeyApi];
            
            NSLog(@"N0rf3n - changeCurrency - urlString : %@",urlString);
            
            NSCharacterSet *set = [NSCharacterSet URLFragmentAllowedCharacterSet];
            NSString * encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:set];
            
            NSLog(@"N0rf3n - changeCurrency - encodedString : %@",encodedString);
            
            //Crear NSURL
            NSURL *url = [NSURL URLWithString:encodedString];
            
            
            NSLog(@"N0rf3n - changeCurrency - url : %@",url);
            
            
            //NSDATA , se puede grabar, imagenes, sonidos, videos y una gran cantidad de datos.. en este caso vamos a guardar el json de la repuesta del servicio web.
            NSData * jsonData = [NSData dataWithContentsOfURL:url]; //almacena el contenido de la url.
            
            NSLog(@"N0rf3n - changeCurrency - jsonData : %@",jsonData);
            
            //Tratamiento de los datos.
            NSError * error = nil;
            
            NSDictionary * dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
            
            NSLog(@"N0rf3n - changeCurrency - dataDictionary : %@",dataDictionary);
            
            if (error == nil) {
                
                NSLog(@"N0rf3n - changeCurrency - realizando conversión.");
                NSLog(@"N0rf3n - changeCurrency - status : %@",dataDictionary[@"status"]);
                
                NSDictionary * result = dataDictionary[@"result"];
                NSArray * info = result[@"conversion"];
                
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"to==%@",lastDivisa.nombre]; //buscar dentro de los registros la divisa.
                NSArray *results = [info filteredArrayUsingPredicate:predicate];
                
                NSLog(@"N0rf3n - changeCurrency - results : %@",results);
                
                NSArray * rate = [results valueForKey:@"rate"];
                
                NSLog(@"N0rf3n - changeCurrency - rate : %@",rate[0]);
                
                float conversionFactor = [rate[0] floatValue]; //convierte el String en Float.
                
                NSLog(@"N0rf3n - changeCurrency - conversionFactor %f",conversionFactor);
                
                float resultConver = conversionFactor * value;
                
                NSLog(@"N0rf3n - changeCurrency - resultConver %f",resultConver);
                
                return conversionFactor * resultConver;
                
            }else{
                
                NSLog(@"N0rf3n - changeCurrency - Error consultando Api");
                return -1;
            }
        }else{//No tiene internet.
            
            NSLog(@"N0rf3n - changeCurrency - Error, sin internet.");
            return -1;
        }
    }
}

//esta funcion validara si el dispositivo esta conectado a internet.
+(BOOL) checkInternet{
    
    NSLog(@"N0rf3n - checkInternet - Begin");

    NSString * urlString = @"http://www.google.com.co";
    
    NSLog(@"N0rf3n - checkInternet - urlString : %@",urlString);
    
    //Crear NSURL
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"N0rf3n - checkInternet - urlString : %@",url);
    
    NSError * errorConexion = nil;
    
    NSString * contenidoGoogle =  [NSString stringWithContentsOfURL:url encoding:0 error:&errorConexion];
    
    NSLog(@"N0rf3n - checkInternet - contenidoGoogle : %@",contenidoGoogle);
    
    NSLog(@"N0rf3n - checkInternet - End");

    return contenidoGoogle != nil;
}


@end
