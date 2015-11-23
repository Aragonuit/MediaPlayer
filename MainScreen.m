//
//  MainScreen.m
//  MediaPlayer
//
//  Created by Aragon on 11/5/15.
//  Copyright © 2015 Aragon. All rights reserved.
//

#import "MainScreen.h"


@interface MainScreen ()


@property (weak, nonatomic) IBOutlet UITableView *tableViewServer;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayStop;
@property (weak, nonatomic) IBOutlet UISlider *slideVolume;

@property (weak, nonatomic) IBOutlet UIView *viewPlay;
@end

@implementation MainScreen
{
    NSArray *ListServer;
    bool isPlay;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     ListServer =@[@"Zing",@"Nct",@"Youtube"];
    self.tableViewServer.dataSource = self;
    self.tableViewServer.delegate = self;
    self.title = @"Media Player";
    
       
}
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//return row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ListServer.count;
}

// cau hinh cell
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = ListServer[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:ListServer[indexPath.row]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.bounds.size.height/3;
}
//su ly su kien click cell
/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Zing" bundle:nil];
            MediaZing* ViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationZing"];
            [self presentViewController:ViewController animated:NO completion:nil];
            
        }
            break;
        case 1:
        {
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Nct" bundle:nil];
            MediaNct* ViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationNct"];
            [self presentViewController:ViewController animated:NO completion:nil];
            
        }
            break;
        case 2:
        {
            UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Youtube" bundle:nil];
            Youtube* ViewController = [storyBoard instantiateViewControllerWithIdentifier:@"NavigationYoutube"];
            [self presentViewController:ViewController animated:NO completion:nil];
            
        }
            break;
        default:
            break;
    }
}










/*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/



@end
