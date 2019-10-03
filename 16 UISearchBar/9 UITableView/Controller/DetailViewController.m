//
//  DetailViewController.m
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/25/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.labelPlanet setText:self.planeta.nombre];
    [self.lblDescripcion setText:self.planeta.descripcion];
    [self.imgPlaneta setImage:[UIImage imageNamed:self.planeta.nombreImagen]];
    
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
