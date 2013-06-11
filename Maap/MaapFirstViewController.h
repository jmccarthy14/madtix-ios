//
//  MaapFirstViewController.h
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaapFirstViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
@property(retain) NSMutableArray* ticketArray;
@end
