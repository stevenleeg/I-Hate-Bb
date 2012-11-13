//
//  AppDelegate.h
//  I Hate Bb
//
//  Created by Steve Gattuso on 11/12/12.
//  Copyright (c) 2012 Riffrat. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Bb.h"
#import "BbDelegate.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, BbDelegate> {
    Bb *script;
    IBOutlet NSTextField *lbl_declining;
    IBOutlet NSTextField *lbl_flex;
    IBOutlet NSProgressIndicator *spinner;
    IBOutlet NSButton *btn_refresh;
}

@property (assign) IBOutlet NSWindow *window;

-(IBAction) refreshBalance: (id) sender;
-(void) balanceReceived:(NSArray *)balances;

@end
