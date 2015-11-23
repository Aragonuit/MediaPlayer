//
//  ScreenPlay.h
//  MediaPlayer
//
//  Created by Aragon on 11/7/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ScreenPlay : UIViewController
@property (strong, nonatomic) AVAudioPlayer* audioPlayer;
@property (weak, nonatomic) NSTimer *tmrCounter;
@end
