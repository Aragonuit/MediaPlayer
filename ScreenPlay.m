//
//  ScreenPlay.m
//  MediaPlayer
//
//  Created by Aragon on 11/7/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "ScreenPlay.h"

@interface ScreenPlay ()
@property (weak, nonatomic) IBOutlet UISlider *sliderVolume;
@property (weak, nonatomic) IBOutlet UISlider *sliderSong;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayStop;
@property (weak, nonatomic) IBOutlet UIImageView *skinAnimation;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIImageView *nowPlayingAnimation;


@end

@implementation ScreenPlay
{
    bool isPlay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isPlay =true;
    [self.sliderVolume setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    [self.sliderVolume setMinimumValueImage:[UIImage imageNamed:@"MuteSpeaker.png"]];
    [self.sliderVolume setMaximumValueImage:[UIImage imageNamed:@"MaxSpeaker.png"]];
    [self.sliderSong setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    //UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 1, 10);
    //UIImage* maxTrack = [[UIImage imageNamed: @"maxtrack.png"] resizableImageWithCapInsets:inset];
    
    /*[self.sliderVolume setMaximumTrackImage:maxTrack
                                  forState:UIControlStateNormal];*/
    [self.sliderVolume setMinimumTrackImage:[UIImage imageNamed: @"mintrack.png"] forState:UIControlStateNormal];
    self.sliderSong.minimumTrackTintColor = [UIColor blueColor];
    self.sliderSong.maximumTrackTintColor = [UIColor whiteColor];
    self.sliderVolume.minimumTrackTintColor = [UIColor whiteColor];
    self.sliderVolume.minimumTrackTintColor = [UIColor blueColor];
    //self.view.backgroundColor = [[UIColor alloc]initWithRed:128.0/255.0 green:0.0/255.0 blue:128.0/255.0 alpha:1];
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"interface2.jpg"]];
    [self AddSkinAnimation];
    [self AddNowPlayingAnimation];
    
    

}

- (IBAction)btnPlayStop:(id)sender {
    if (isPlay)
    {
        [self.btnPlayStop setImage:[UIImage imageNamed:@"Stop"] forState:UIControlStateNormal];
        isPlay = false;
        [self.skinAnimation startAnimating];
        [self.nowPlayingAnimation startAnimating];
        [self Play];
    }
    else
    {
        self.btnPlayStop.imageView.image = [UIImage imageNamed:@"Play"];
        [self.btnPlayStop setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
        isPlay = true;
        [self.skinAnimation stopAnimating];
        [self.nowPlayingAnimation stopAnimating];
        [self Stop];
    }

    
}
-(void)AddSkinAnimation
{
    
        NSMutableArray* imageAnimation = [[NSMutableArray alloc]initWithCapacity:150];
        for (int i =1; i <= 150; i++)
        {
            NSString *image;
            image = [NSString stringWithFormat:@"Skin (%d).jpg",i];
            [imageAnimation addObject:[UIImage imageNamed:image]];
        }
            self.skinAnimation.animationImages = imageAnimation;
            self.skinAnimation.animationDuration = 5;
            self.skinAnimation.animationRepeatCount = 0 ;
}
-(void)AddNowPlayingAnimation
{
    
    NSMutableArray* imageAnimation = [[NSMutableArray alloc]initWithCapacity:5];
    for (int i =0; i <= 4; i++)
    {
        NSString *image;
        image = [NSString stringWithFormat:@"NowPlayingBars%d",i];
        [imageAnimation addObject:[UIImage imageNamed:image]];
    }
    self.nowPlayingAnimation.animationImages = imageAnimation;
    self.nowPlayingAnimation.animationDuration = 0.3;
    self.nowPlayingAnimation.animationRepeatCount = 0 ;
}

-(void)Play
{
    if (!self.audioPlayer) {
        
        
        NSString* filePath = @"http://mp3.zing.vn/xml/load-song/MjAxNSUyRjExJTJGMTglMkZlJTJGZiUyRmVmYWVmMmEyYmE3OTY5MzdjNTFjMTU4MTQ3NWM0M2M2Lm1wMyU3QzEz";
        NSURL *url = [NSURL URLWithString:filePath];
        NSError *error;
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
        
        if (error) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error.debugDescription delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
            [alert show];
            return;
            
        }
        [self.audioPlayer prepareToPlay];
        NSMutableString *infoString = [[NSMutableString alloc] init];
        [infoString appendFormat:@"Number of channels %lu\n", (unsigned long)self.audioPlayer.numberOfChannels];
        [infoString appendFormat:@"Duration %f", self.audioPlayer.duration];
        NSLog(@"%@", infoString);
        self.audioPlayer.delegate = self;
    }
    if (!self.audioPlayer.playing) {
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[AVAudioSession sharedInstance] setActive: YES error: nil];
        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        
        [self.audioPlayer play];
        self.tmrCounter = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(updateElapsedTime) userInfo:nil repeats:YES];
        
    }

        
}

-(void)Stop
{
    if (self.audioPlayer && self.audioPlayer.playing){
        [self.audioPlayer stop];
    }
}
- (IBAction)updateProgress:(id)sender {
    [_audioPlayer setCurrentTime:[self.audioPlayer duration] *_sliderSong.value];
}
-(void)updateElapsedTime{
    if (self.audioPlayer) {
        [_sliderSong setValue:[self.audioPlayer currentTime] / [self.audioPlayer duration]];
        [_lblTime setText:[NSString stringWithFormat:@"%@", [self formatTime:[self.audioPlayer currentTime]]]];
    }
}
-(NSString*)formatTime:(float)time{
    int minutes = time / 60;
    int seconds = (int)time % 60;
    return [NSString stringWithFormat:@"%@%d:%@%d", minutes / 10 ? [NSString stringWithFormat:@"%d", minutes / 10] : @"", minutes % 10, [NSString stringWithFormat:@"%d", seconds / 10], seconds % 10];
}
- (IBAction)sliderVolumeChange:(id)sender {
  
    if (self.audioPlayer) {
         self.audioPlayer.volume = self.sliderVolume.value;
    }
}

- (void) viewWillDisappear:(BOOL)animated {
   
        if (self.audioPlayer) {
            [self.audioPlayer stop];
        }
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: NO error: nil];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    
}



@end
