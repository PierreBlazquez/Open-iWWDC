//
//  ViewController.h
//  iWWDC
//
//  Created by Pierre BLAZQUEZ on 26/05/2014.
//  Copyright (c) 2014 Pierre BLAZQUEZ. All rights reserved.
//

#import <Social/Social.h>
#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"

#import "ModalViewController.h"

@interface ViewController : UIViewController {
    NSDate *today, *wwdc;
    NSArray *phrase1, *phrase2;
    BOOL hasStarted;
}

@property (weak, nonatomic) IBOutlet UILabel *wwdcTitle;
@property (weak, nonatomic) IBOutlet UIImageView *wwdcImage;
@property (weak, nonatomic) IBOutlet UILabel *yes;
@property (weak, nonatomic) IBOutlet UILabel *cpt;
@property (weak, nonatomic) IBOutlet UILabel *info;

@end
