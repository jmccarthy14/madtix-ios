//
//  TicketViewController.m
//  Maap
//
//  Created by Joe McCarthy on 6/12/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "TicketViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface TicketViewController ()
@property(strong, nonatomic) MtTicketResponse* ticket;
@end

@implementation TicketViewController{
    GMSMapView *mapView_;
}
@synthesize ticket, ticketTitleLabel, ticketLocationLabel, ticketPriceLabel;
- (IBAction)doneButtonClicked:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}

- (id) initWithTicket:(MtTicketResponse *)mtTicketResponse {
    if (self = [super initWithNibName:@"TicketViewController" bundle:nil]) {
        self.ticket = mtTicketResponse;
        
    }
    return self;
}

- (void) loadView {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    [super loadView];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                        longitude:151.20
                                                             zoom:6];
    mapView_ = [GMSMapView mapWithFrame:self.googleMapView.bounds camera:camera];
    mapView_.myLocationEnabled = YES;
    [self.googleMapView addSubview:mapView_];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"Setting title to %@", self.ticket.title);
    self.ticketTitleLabel.text = self.ticket.title;
    self.ticketLocationLabel.text = self.ticket.pickup_location;
    self.ticketPriceLabel.text = [@"$" stringByAppendingString:self.ticket.price];
}

- (void) fetchLocationCoordinatesRequest {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setGoogleMapView:nil];
    [super viewDidUnload];
}
@end
