//
//  InstagramController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/26/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "InstagramController.h"

@interface InstagramController ()

@end

@implementation InstagramController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //1. construir la URL
    //NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:nil]]; //recupera la ruta de la memoria donde esta la pagina local.
    NSURL *url = [NSURL URLWithString:@"https://www.instagram.com/n0rf3n/"];
    
    NSLog(@"N0rf3n WebController - url : %@",url);
    
    //2.crear la petición
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //3.Mostrar la pagina en el componente,
    [self.instagramWeb loadRequest:request];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
