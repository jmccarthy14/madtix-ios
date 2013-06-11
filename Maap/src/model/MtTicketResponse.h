//
//  MtTicketResponse.h
//  Maap
//
//  Created by Joe McCarthy on 6/10/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MtTicketResponse : NSDictionary
@property NSString* created;
@property NSString* description;
@property NSString* external_listing_url;
@property NSString* external_src;
@property NSString* pickup_location;
@property NSString* price;
@property NSString* seller_email_address;
@property NSString* seller_phone;
@property NSString* title;
@property NSString* updated;
@end
