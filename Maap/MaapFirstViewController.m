//
//  MaapFirstViewController.m
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "MaapFirstViewController.h"
#import "BuyerViewListingTableCell.h"
#import "MtTicketResponse.h"
#import "AFJSONRequestOperation.h"

@interface MaapFirstViewController ()

@end


@implementation MaapFirstViewController
@synthesize ticketArray;
static NSString *buyerViewCellId = @"BuyerViewListingTableCellIdentifier";
NSArray* showTitles;
NSArray* showLocations;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Buy", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.ticketArray = [[NSMutableArray alloc] init];
        [self makeApiRequest];
        [self.tableView registerNib:[UINib nibWithNibName:@"BuyerViewListingTableCell" bundle:nil] forCellReuseIdentifier:buyerViewCellId];

    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typicsally from a nib.
    showTitles = [NSArray arrayWithObjects:@"The Walkmen", @"Purity Ring", @"The Vaccines", @"Waxahatchee", @"John Hiatt", nil];
    showLocations = [NSArray arrayWithObjects:@"St Paul, MN", @"San Francisco, CA", @"Boston, MA", @"Williamsburg, NY", @"Newark, NJ", nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BuyerViewListingTableCell *buyerViewListingTableCell = (BuyerViewListingTableCell *)[tableView dequeueReusableCellWithIdentifier:buyerViewCellId];
    if(!buyerViewListingTableCell) {
        buyerViewListingTableCell = [[NSBundle mainBundle] loadNibNamed:@"BuyerViewListingTableCell" owner:self options:nil].lastObject;
    }
    
    buyerViewListingTableCell.showTitle.text = [[ticketArray objectAtIndex:indexPath.row] title];
    buyerViewListingTableCell.location.text = [[ticketArray objectAtIndex:indexPath.row] pickup_location];
    
    return buyerViewListingTableCell;
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ticketArray count];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void) makeApiRequest {
    NSURL *url = [NSURL URLWithString:@"http://localhost:8000/api/tickets"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    void (^successBlock)(NSURLRequest*, NSHTTPURLResponse*, id) = ^(NSURLRequest * request, NSHTTPURLResponse *response, id json) {
        NSArray *jsonArray = (NSArray *) json;
        NSLog(@"Size of array: %d", [jsonArray count]);
        self.ticketArray = [[NSMutableArray alloc] init];
        for(NSDictionary* dictionary in jsonArray) {
            NSLog(@"dict: %@", dictionary);
            MtTicketResponse* mtTicketResponse = [[MtTicketResponse alloc] init];
            [mtTicketResponse setValuesForKeysWithDictionary:[dictionary valueForKey:@"fields"]];
            [ticketArray addObject:mtTicketResponse];
        }
        [self.tableView reloadData];

        NSLog(@"IP Address:");
    };
    
    void (^failBlock)(id, id, id, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError* error, id json) {
        NSLog(@"fail");
    };
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:failBlock];
    
    [operation start];
}




@end
