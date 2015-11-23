//
//  MediaNct.m
//  MediaPlayer
//
//  Created by Aragon on 11/6/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "MediaNct.h"

@interface MediaNct ()

@end

@implementation MediaNct

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnBack:(id)sender {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainScreen* ViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationMain"];
    [self presentViewController:ViewController animated:NO completion:nil];
}

@end
