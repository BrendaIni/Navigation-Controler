//
//  DestinationDetails.h
//  Navigation Controller
//
//  Created by Brenda Iñiguez on 7/24/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationDetails : UIViewController
@property NSString *destinationTitle;
@property NSString *destinationDescription;
@property NSString *destinationPhoto;

@property (strong, nonatomic) IBOutlet UIImageView *imgDestination;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@end
