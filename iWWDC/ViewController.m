//
//  ViewController.m
//  iWWDC
//
//  Created by Pierre BLAZQUEZ on 26/05/2014.
//  Copyright (c) 2014 Pierre BLAZQUEZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        ModalViewController *modal=[self.storyboard instantiateViewControllerWithIdentifier:@"ModalView"];
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        modal.heritedView=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [self presentViewController:modal animated:true completion:nil];
    } 
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    SLComposeViewController *twitterController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterController setInitialText:@"iWWDC, has the WWDC finally started? Made by @pierre_blazquez. #WWDC14"];
    [twitterController addURL:[NSURL URLWithString:@"http://www.pierreblazquez.com/"]];
    [self presentViewController:twitterController animated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor orangeColor];
    self.wwdcImage.image=[[UIImage imageNamed:@"icon_340.png"] applyBlurWithRadius:5 tintColor:[UIColor clearColor] saturationDeltaFactor:1 maskImage:nil];
    [self registerEffectForView:self.wwdcTitle depth:10];
    [self registerEffectForView:self.wwdcImage depth:20];
    [self registerEffectForView:self.yes depth:30];
    [self registerEffectForView:self.cpt depth:10];
    [self registerEffectForView:self.info depth:10];
    phrase1=[[NSArray alloc] initWithObjects:@"But we're getting closer!", @"Relax, you didn't miss the introduction Keynote", @"Relax, you'll be able to see Timy on stage!", @"Relax, you didn't miss iOS 8's introduction", @"Relax, you didn't miss OS X 10.10's new design!", @"Don't you think it's frustrating to have to wait?", @"What will be the next Federighi's nickname on Game Center?", @"Healthbook?", @"New Siri?", @"Siri for Mac OS X?", @"New MacBook Air?", @"New Mac mini?", @"TouchID for Mac?", @"Let's hope we'll be surprised!", @"iWatch?", @"Introducing iPhone maxi and iPad Pro with iOS X!", @"Home automation?", nil];
    phrase2=[[NSArray alloc] initWithObjects:@"Have fun!", @"Have fun with iOS 8", @"I hope that Timy was awesome!", @"Is iOS 8 that great?", @"Is OS X 10.10 that great?", @"New design, huh...", @"Let's discover the names of the TBA sessions!", @"iOS 8 under NDA? #myass", @"OS X 10.10 under NDA? #myass", @"Have fun with OS X 10.10", @"So, Apple loves flat design", @"'Can't innovate anymore? #myass'", nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	// Do any additional setup after loading the view, typically from a nib.
    NSDateFormatter *myAwesomeFormatter=[[NSDateFormatter alloc] init];
    [myAwesomeFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    today=[NSDate date];
    wwdc=[myAwesomeFormatter dateFromString:@"2014-06-02 10:00:00"];
    if ([wwdc compare:today]==NSOrderedAscending) hasStarted=true;
    else hasStarted=false;
    NSLog(@"Is that fucking WWDC started? %d", hasStarted);
    [self setEnvironmentWithBool:hasStarted];
}

- (void)setEnvironmentWithBool:(BOOL)start {
    if (start) {
        self.yes.textColor=[UIColor orangeColor];
        self.yes.text=@"YES!";
        self.cpt.text=@"They were right, it has happened!";
        NSInteger count=phrase2.count;
        int choice=arc4random()%count;
        self.info.text=[phrase2 objectAtIndex:choice];
    }
    else {
        self.yes.textColor=[UIColor redColor];
        self.yes.text=@"No!";
        NSInteger cpt=[self daysBetweenDate:today andDate:wwdc];
        if (cpt == 1)
            self.cpt.text=@"The mayas said it will be tomorrow";
        else
            self.cpt.text=[NSString stringWithFormat:@"The mayas said it will be in %d days", cpt];
        NSInteger count=phrase1.count;
        int choice=arc4random()%count;
        self.info.text=[phrase1 objectAtIndex:choice];
    }
}

- (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
