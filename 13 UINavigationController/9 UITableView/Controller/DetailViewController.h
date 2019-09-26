//
//  DetailViewController.h
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/25/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "Planeta.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelPlanet;

@property(strong, nonatomic) Planeta * planeta;

@end

NS_ASSUME_NONNULL_END
