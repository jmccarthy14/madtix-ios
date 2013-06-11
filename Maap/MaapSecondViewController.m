//
//  MaapSecondViewController.m
//  Maap
//
//  Created by Joe McCarthy on 5/29/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import "MaapSecondViewController.h"
#import "AFJSONRequestOperation.h"
#import "MtTicketResponse.h"

@interface MaapSecondViewController ()

@end

@implementation MaapSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Sell", @"Second");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)apiTest:(id)sender {
    NSLog(@"Clicked me");
    [self makeApiRequest];
}

- (void) makeApiRequest {
    NSURL *url = [NSURL URLWithString:@"http://localhost:8000/api/tickets"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    void (^successBlock)(NSURLRequest*, NSHTTPURLResponse*, id) = ^(NSURLRequest * request, NSHTTPURLResponse *response, id json) {
        NSArray *jsonArray = (NSArray *) json;
        NSLog(@"Size of array: %d", [jsonArray count]);
        NSMutableArray* responseArray = [[NSMutableArray alloc] init];
        for(NSDictionary* dictionary in jsonArray) {
            NSLog(@"dict: %@", dictionary);
            MtTicketResponse* mtTicketResponse = [[MtTicketResponse alloc] init];
            [mtTicketResponse setValuesForKeysWithDictionary:[dictionary valueForKey:@"fields"]];
            [responseArray addObject:mtTicketResponse];
        }
        
        // Test
        for(MtTicketResponse* ticket in responseArray) {
            NSLog(@"ticket title: %@", [ticket title]);
        }
            NSLog(@"IP Address:");
    };
    
    void (^failBlock)(id, id, id, id) = ^(NSURLRequest *request, NSHTTPURLResponse *response, NSError* error, id json) {
        NSLog(@"fail");
    };
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:successBlock failure:failBlock];
//    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
//        NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
//    } failure:nil];
    
    [operation start];
}
@end
