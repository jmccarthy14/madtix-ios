//
//  BuyerViewListingTableCell.h
//  Maap
//
//  Created by Joe McCarthy on 5/30/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyerViewListingTableCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UILabel *showTitle;
    @property (weak, nonatomic) IBOutlet UILabel *location;
    @property (weak, nonatomic) IBOutlet UIButton *buyButton;
@end
