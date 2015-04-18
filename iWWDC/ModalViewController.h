//
//  ModalViewController.h
//  iWWDC
//
//  Created by Pierre BLAZQUEZ on 27/05/2014.
//  Copyright (c) 2014 Pierre BLAZQUEZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"

@interface ModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) UIImage *heritedView;
- (IBAction)close:(id)sender;
- (IBAction)wwdc:(id)sender;
- (IBAction)twitter:(id)sender;

@end
