//
//  MaapFirstViewController.m
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "MaapFirstViewController.h"
#import "BuyerViewListingTableCell.h"

@interface MaapFirstViewController ()

@end


@implementation MaapFirstViewController
static NSString *buyerViewCellId = @"BuyerViewListingTableCellIdentifier";
NSArray* showTitles;
NSArray* showLocations;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Buy", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
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
    
    buyerViewListingTableCell.showTitle.text = [showTitles objectAtIndex:indexPath.row];
    buyerViewListingTableCell.location.text = [showLocations objectAtIndex:indexPath.row];
    
    return buyerViewListingTableCell;
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [showTitles count];
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}





@end
