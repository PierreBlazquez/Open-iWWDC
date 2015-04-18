//
//  ModalViewController.m
//  iWWDC
//
//  Created by Pierre BLAZQUEZ on 27/05/2014.
//  Copyright (c) 2014 Pierre BLAZQUEZ. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
    self.background.image=[self.heritedView applyLightEffect];
    [self registerEffectForView:self.background depth:20];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)wwdc:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://developer.apple.com/wwdc/"]];
}

- (IBAction)twitter:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/pierre_blazquez"]];
}


- (void)registerEffectForView:(UIView *)aView depth:(CGFloat)depth;
{
	UIInterpolatingMotionEffect *effectX;
	UIInterpolatingMotionEffect *effectY;
    effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x"
                                                              type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y"
                                                              type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
	
	
	effectX.maximumRelativeValue = @(depth);
	effectX.minimumRelativeValue = @(-depth);
	effectY.maximumRelativeValue = @(depth);
	effectY.minimumRelativeValue = @(-depth);
	
	[aView addMotionEffect:effectX];
	[aView addMotionEffect:effectY];
}

@end
