//
//  CityDetails.m
//  Navigation Controller
//
//  Created by Brenda Iñiguez on 8/7/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import "CityDetails.h"

@interface CityDetails ()

@end

@implementation CityDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgCityTitle.text          = self.cityDestinationTitle;
    self.imgCityDescription.text    = self.cityDestinationDescription;
    self.imgCityPhoto.image   = [UIImage imageNamed:self.cityDestinationPhoto];
    
    self.imgCityDescription.numberOfLines = 0;
    [self.imgCityDescription sizeToFit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
