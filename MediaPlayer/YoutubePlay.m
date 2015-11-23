//
//  YoutubePlay.m
//  MediaPlayer
//
//  Created by Aragon on 11/6/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "YoutubePlay.h"

@interface YoutubePlay ()
@property (weak, nonatomic) IBOutlet YTPlayerView *youtubePlay;

@end

@implementation YoutubePlay

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.youtubePlay loadWithVideoId:@"enD7YErEZhQ" playerVars:@{@"playsinline": @1,
                                                                  @"controls"   : @1,
                                                                  @"showinfo"   : @0}];
    
    [self.youtubePlay playVideo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
