//
//  WebController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/26/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "WebController.h"

@interface WebController ()

@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    //1. construir la URL
    //NSURL * url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:nil]]; //recupera la ruta de la memoria donde esta la pagina local.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"about" withExtension:@"html" subdirectory:@"tabbar-about"];
    
    NSLog(@"N0rf3n WebController - url : %@",url);
    
    //2.crear la petición
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    //3.Mostrar la pagina en el componente,
    [self.webViewN0r loadRequest:request];
    
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
