//
//  Youtube.m
//  MediaPlayer
//
//  Created by Aragon on 11/6/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "Youtube.h"

@interface Youtube ()

@end

@implementation Youtube
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnBack:(id)sender {
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainScreen* ViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationMain"];
    [self presentViewController:ViewController animated:NO completion:nil];
}

@end
