//
//  TicketViewController.m
//  Maap
//
//  Created by Joe McCarthy on 6/12/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "TicketViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "AFJSONRequestOperation.h"
#import "NSString+URLEncoding.h"

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
        [self fetchLocationCoordinatesRequest];
        
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
    NSString* encodedLocation = [self.ticket.pickup_location urlEncodeUsingEncoding:NSUTF8StringEncoding];
    NSString *urlString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?address=%@&sensor=true",encodedLocation];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    void (^successBlock)(NSURLRequest*, NSHTTPURLResponse*, id) = ^(NSURLRequest * request, NSHTTPURLResponse *response, id json) {
        NSDictionary *jsonDictionary = (NSDictionary *) json;
        NSLog(@"Json: %@", json);
        NSString* addressFormatted =[[jsonDictionary valueForKeyPath:@"results.formatted_address"] objectAtIndex:0];
        NSLog(@"address: %@", addressFormatted);
        self.ticketLocationLabel.text = addressFormatted;
        
        NSString* latitude =[[jsonDictionary valueForKeyPath:@"results.geometry.location.lat"]objectAtIndex:0];
        
        NSString* longitude =[[jsonDictionary valueForKeyPath:@"results.geometry.location.lng"]objectAtIndex:0];
        
        NSLog(@"lat: %@, lng: %@", latitude, longitude);
        
        GMSCameraPosition *myLocation = [GMSCameraPosition cameraWithLatitude:[latitude doubleValue] longitude:[longitude doubleValue] zoom:14];
        [mapView_ setCamera:myLocation];
        
        for(NSDictionary* values in jsonDictionary.allValues) {

//            [mtTicketResponse setValuesForKeysWithDictionary:[dictionary valueForKey:@"fields"]];
        }
    };
    
    void (^failBlock)(id, id, id, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError* error, id json) {
        NSLog(@"fail");
    };
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:failBlock];
    
    [operation start];
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
