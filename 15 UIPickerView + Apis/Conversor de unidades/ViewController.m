//
//  ViewController.m
//  Conversor de unidades
//
//  Created by Antonio Cañas on 9/12/15.
//  Copyright © 2015 Antonio Cañas. All rights reserved.
//

#import "ViewController.h"
#import "Divisa.h"
#import "Exchange.h"

@interface ViewController () {
    NSArray *pickerData;
    NSString *boxResult;
    NSString *actualNumber;
    BOOL result;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Divisa * eur = [[Divisa alloc] initWhitName:@"EUR"];
    Divisa * aud = [[Divisa alloc] initWhitName:@"AUD"];
    Divisa * gbp = [[Divisa alloc] initWhitName:@"GBP"];
    Divisa * jpy = [[Divisa alloc] initWhitName:@"JPY"];
    Divisa * usd = [[Divisa alloc] initWhitName:@"USD"];
 
    pickerData = [[NSArray alloc] initWithObjects:eur,aud,gbp,jpy,usd, nil];

    result = false;
    
    //el pickerSelect tendra como delegado y como data source, esta propia clase.
    self.pickerSelect.delegate = self;
    self.pickerSelect.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)num:(UIButton *)sender {
        
    //Recojemos el valor introducido por el usuario en el campo
    NSString *currentValue = self.labelValue.text;
    
    if(result)
    {
        if([sender.titleLabel.text isEqual: @"."])
        {
            [self.labelValue setText:[NSString stringWithFormat:@"0%@", sender.titleLabel.text]];
            result = false;
        }
        else
        {
            [self.labelValue setText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
            result = false;
        }
    }
    else
    {
        if([self.labelValue.text isEqual: @"0"]){
            if([sender.titleLabel.text isEqual: @"."])
            {
                [self.labelValue setText:[NSString stringWithFormat:@"0%@", sender.titleLabel.text]];
                result = false;
            }
            else
            {
                [self.labelValue setText:[NSString stringWithFormat:@"%@", sender.titleLabel.text]];
                result = false;
            }
        }
        else
        {
            NSString *concat = [NSString stringWithFormat:@"%@%@", currentValue, sender.titleLabel.text];
            [self.labelValue setText:concat];
        }
    }
    
}

- (IBAction)buttonDelete:(UIButton *)sender {
    
    actualNumber = @"";
    [self.labelValue setText:actualNumber];
    [self.labelResultadoConversion setText:actualNumber];
    
}

- (IBAction)buttonResult:(UIButton *)sender {
    
    //Obtener las divisas seleccionadas.
    long initRow = [self.pickerSelect selectedRowInComponent:0]; //retorna la selección del primer picker.
    long lastRown= [self.pickerSelect selectedRowInComponent:1]; //retorna la segunda selección del segundo picker.
    
    NSLog(@"N0rf3n - buttonResult - initRow : %ld",initRow);
    NSLog(@"N0rf3n - buttonResult - lastRown : %ld",lastRown);
    
    //Se instancian los objectos.
    Divisa * fristDivisa = [pickerData objectAtIndex:initRow];
    Divisa * lastDivisa = [pickerData objectAtIndex:lastRown];
    
    NSLog(@"N0rf3n - buttonResult - fristDivisa : %@",fristDivisa.nombre);
    NSLog(@"N0rf3n - buttonResult - lastDivisa : %@",lastDivisa.nombre);
    
    float valor = [self.labelValue.text floatValue]; //Se recupera el valor digitado por el usuario y se convierte a float.

    NSLog(@"N0rf3n - buttonResult - valor : %f",valor);
    
    float resultadoConversion = [Exchange changeCurrency:fristDivisa for:lastDivisa currencyValue:valor];//Se invoca al metodo changeCurrency
    
    [self.labelResultadoConversion setText:[NSString localizedStringWithFormat:@"%.1f %@ = %.1f %@", valor, fristDivisa.nombre, resultadoConversion, lastDivisa.nombre  ]];
    
    
    
    
    result = true;
    
}

#pragma mark - Metodos del UIPickerViewDataSource y UIPickerViewDelegate

//Un pickerView tiene varias columnas, este picker va a tener 2 columnas.. o dos componentes.
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return pickerData.count; //Cantidad de elementos.
}


//Este metodo incoporara una imagen y un texto, por lo tanto este metodo nos permitira realizar esta operacion.
-(UIView *) pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view{
    
    
    //Recuperar las divisas
    Divisa * divisa = [pickerData objectAtIndex:row];
    
    //Se construye una imgView con la imagen de la divisa.
    UIImageView * tempImage = [[UIImageView alloc] initWithImage:divisa.imagen];
    //la imagen no puede ocupar toda la pantalla, por lo tanto se intancia
    [tempImage  setFrame:CGRectMake(0, 42, 22, 16)];
    
    
    //Se define el espacio para el label o texto.
    UILabel *tempName = [[UILabel alloc] initWithFrame:CGRectMake(30, 10.3, 80, 80)];
    [tempName setText:divisa.nombre];
    tempName.backgroundColor  = [UIColor clearColor];
    
    
    //Se debe juntar la imagen y el texto en una vista
    
    UIView * finalView =  [[UIView alloc] initWithFrame:CGRectMake(20, 20, 60, 100 )];
    [finalView insertSubview:tempImage atIndex:0]; //SUB VISTA
    [finalView insertSubview:tempName  atIndex:1];
    
    return finalView;
}
@end
