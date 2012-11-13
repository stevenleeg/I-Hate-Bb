//
//  Bb.m
//  I Hate Bb
//
//  Created by Steve Gattuso on 11/12/12.
//  Copyright (c) 2012 Riffrat. All rights reserved.
//

#import "Bb.h"

@implementation Bb

@synthesize delegate;

-(id) init {
    self = [super init];
    
    // Get the location to the Bb script
    BbPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/Contents/Resources/bb"];
    
    return self;
}

-(void) startGetBalance {
    NSTask *task = [[NSTask alloc] init];
    NSPipe *pipe = [[NSPipe alloc] init];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver: self selector:@selector(taskFinished:) name:NSTaskDidTerminateNotification object:task];
    [task setLaunchPath: BbPath];
    [task setArguments:[NSArray arrayWithObjects:@"balance", @"-q", nil]];
    [task setStandardOutput:pipe];
    
    NSFileHandle *data = [pipe fileHandleForReading];
    [nc addObserver: self selector:@selector(readBalance:) name:NSFileHandleReadCompletionNotification object:data];
    [task launch];
    [data readInBackgroundAndNotify];
}

-(void) taskFinished: (NSNotification *) notification {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

-(void) readBalance: (NSNotification*) notification {
    // Get the string version of the balance
    NSData *data = [[notification userInfo] objectForKey: NSFileHandleNotificationDataItem];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    // Now PARSE!!!
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle: NSNumberFormatterDecimalStyle];
    NSArray *balances = [string componentsSeparatedByString:@" "];
    
    [[self delegate] balanceReceived: balances];
}

@end
