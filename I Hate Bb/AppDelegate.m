//
//  AppDelegate.m
//  I Hate Bb
//
//  Created by Steve Gattuso on 11/12/12.
//  Copyright (c) 2012 Riffrat. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    script = [[Bb alloc] init];
    [script setDelegate: self];
    [script startGetBalance];
    [spinner startAnimation:nil];
    [btn_refresh setHidden: YES];
}

-(IBAction) refreshBalance: (id) sender {
    [btn_refresh setHidden: YES];
    [lbl_declining setHidden: YES];
    [lbl_flex setHidden: YES];
    [spinner setHidden: NO];
    [spinner startAnimation: nil];
    [script startGetBalance];
}

-(void) balanceReceived:(NSArray *)balances {
    [lbl_declining setStringValue: [balances objectAtIndex: 0]];
    [lbl_flex setStringValue: [balances objectAtIndex: 1]];
    
    [lbl_declining setHidden: NO];
    [lbl_flex setHidden: NO];
    [spinner stopAnimation:nil];
    [spinner setHidden: YES];
    [btn_refresh setHidden: NO];
}

@end
