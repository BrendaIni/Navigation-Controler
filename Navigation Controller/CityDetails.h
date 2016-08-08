//
//  CityDetails.h
//  Navigation Controller
//
//  Created by Brenda Iñiguez on 8/7/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationDetails.h"


@interface CityDetails : UIViewController

@property NSString *cityDestinationTitle;
@property NSString *cityDestinationDescription;
@property NSString *cityDestinationPhoto;

@property (strong, nonatomic) IBOutlet UIImageView *imgCityPhoto;
@property (strong, nonatomic) IBOutlet UILabel *imgCityTitle;
@property (strong, nonatomic) IBOutlet UILabel *imgCityDescription;

@end
