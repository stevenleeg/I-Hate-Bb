//
//  BbDelegate.h
//  I Hate Bb
//
//  Created by Steve Gattuso on 11/12/12.
//  Copyright (c) 2012 Riffrat. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BbDelegate <NSObject>

-(void) balanceReceived: (NSArray *) balances;

@end
