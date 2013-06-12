//
//  NSString+URLEncoding.h
//  Maap
//
//  Created by Joe McCarthy on 6/12/13.
//  Copyright (c) 2013 Joseph McCarthy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
@end
