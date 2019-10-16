//
//  ViewController.h
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/18/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating> //los obejctos entre los <> son delegados.

@property (strong, nonatomic) IBOutlet UITableView *tablaPlanetas;

@end

