//
//  DestinationDetails.m
//  Navigation Controller
//
//  Created by Brenda Iñiguez on 7/24/16.
//  Copyright (c) 2016 UAGMobile. All rights reserved.
//

#import "DestinationDetails.h"

@interface DestinationDetails ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityDescriptions;
@property NSMutableArray *cityPhotos;


@property NSString *stCityTitleSelected;
@property NSString *stCityDescriptionSelected;
@property NSString *stCityPhotoSelected;

@end

@implementation DestinationDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblTitle.text          = self.destinationTitle;
    self.lblDescription.text    = self.destinationDescription;
    self.imgDestination.image   = [UIImage imageNamed:self.destinationPhoto];
    
    self.lblDescription.numberOfLines = 0;
    [self.lblDescription sizeToFit];
    [self initController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-------------------------------------------------------------------------------
- (void)initController {
    if([self.destinationTitle  isEqual: @"Michoacan"]){
    self.cityTitles          = [[NSMutableArray alloc] initWithObjects: @"Morelia", @"Zamora", @"Janitzio", @"Uruapan", @"Quiroga", nil];
    self.cityPhotos          = [[NSMutableArray alloc] initWithObjects: @"Michoacan.jpg", @"Jalisco.jpg", @"SanLuis.jpg", @"Chiapas.jpeg", @"Sinaloa.jpeg", nil];
    self.cityDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Ven y visita los lagos y maravillas naturales", @"Disfruta del delicioso tequila elaborado en este estado", @"Para los que aman el ecoturismo, es un exelente destino", @"Conoce la comida y la gente únicos de este lugar", @"Conoce las playas y aventuras que tenemos para ti", nil];
    }else if ([self.destinationTitle  isEqual: @"Jalisco"]){
        self.cityTitles          = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Tepatitlan", @"Tequila", @"Mazamitla", @"Puerto Vallarta", nil];
        self.cityPhotos          = [[NSMutableArray alloc] initWithObjects: @"Michoacan.jpg", @"Jalisco.jpg", @"SanLuis.jpg", @"Chiapas.jpeg", @"Sinaloa.jpeg", nil];
        self.cityDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Ven y visita los lagos y maravillas naturales", @"Disfruta del delicioso tequila elaborado en este estado", @"Para los que aman el ecoturismo, es un exelente destino", @"Conoce la comida y la gente únicos de este lugar", @"Conoce las playas y aventuras que tenemos para ti", nil];
    }else if ([self.destinationTitle  isEqual: @"San Luis Potosí"]){
        self.cityTitles          = [[NSMutableArray alloc] initWithObjects: @"San Luis Potosí", @"Soledad Díaz Gutierrez", @"Ciudad Valles", @"Matehuala", @"Río Verde", nil];
        self.cityPhotos          = [[NSMutableArray alloc] initWithObjects: @"Michoacan.jpg", @"Jalisco.jpg", @"SanLuis.jpg", @"Chiapas.jpeg", @"Sinaloa.jpeg", nil];
        self.cityDescriptions   = [[NSMutableArray alloc] initWithObjects: @"Ven y visita los lagos y maravillas naturales", @"Disfruta del delicioso tequila elaborado en este estado", @"Para los que aman el ecoturismo, es un exelente destino", @"Conoce la comida y la gente únicos de este lugar", @"Conoce las playas y aventuras que tenemos para ti", nil];
    }
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellCity *cell = (cellCity *)[tableView dequeueReusableCellWithIdentifier:@"cellCity"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellCity" bundle:nil] forCellReuseIdentifier:@"cellCity"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellCity"];
    }
    //Fill cell with info from arrays
    cell.lblCityTitle.text   = self.cityTitles[indexPath.row];
    cell.lblCityDescription.text        = self.cityDescriptions[indexPath.row];
    cell.imgCityPhoto.image       = [UIImage imageNamed:self.cityPhotos[indexPath.row]];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.stCityTitleSelected        = self.cityTitles[indexPath.row];
    self.stCityDescriptionSelected  = self.cityDescriptions[indexPath.row];
    self.stCityPhotoSelected        = self.cityPhotos[indexPath.row];
    [self performSegueWithIdentifier:@"CityDetails" sender:self];
}
/**********************************************************************************************/
#pragma mark - Navigation
/**********************************************************************************************/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[CityDetails class]]) {
        CityDetails *destinationCity     = [segue destinationViewController];
        destinationCity.cityDestinationTitle        = self.stCityTitleSelected;
        destinationCity.cityDestinationDescription  = self.stCityDescriptionSelected;
        destinationCity.cityDestinationPhoto        = self.stCityPhotoSelected;
        
    }
}



@end
