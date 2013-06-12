//
//  TicketViewController.h
//  Maap
//
//  Created by Joe McCarthy on 6/12/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MtTicketResponse.h"

@interface TicketViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *ticketTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketPriceLabel;
@property (weak, nonatomic) IBOutlet UIView *googleMapView;
- (IBAction)doneButtonClicked:(id)sender;
- (id) initWithTicket:(MtTicketResponse *) mtTicketResponse;
@end
