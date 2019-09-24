//
//  PlanetCellTableView.h
//  9 UITableView
//
//  Created by Alejandro Ariza on 9/19/19.
//  Copyright © 2019 Alejandro Ariza. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlanetCellTableView : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UIImageView *imgViewPlanet;

@end

NS_ASSUME_NONNULL_END
