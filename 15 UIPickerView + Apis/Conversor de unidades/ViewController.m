//
//  ViewController.m
//  Conversor de unidades
//
//  Created by Antonio Cañas on 9/12/15.
//  Copyright © 2015 Antonio Cañas. All rights reserved.
//

#import "ViewController.h"
#import "Divisa.h"

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
    

    
    [self.labelResultadoConversion setText:@"Hay que programar la conversión!"];

    
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
