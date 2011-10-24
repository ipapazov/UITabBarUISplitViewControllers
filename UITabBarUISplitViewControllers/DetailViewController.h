//
//  DetailViewController.h
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "MasterDetailDelegate.h"

@interface DetailViewController : UIViewController
                    <UISplitViewControllerDelegate, MasterDetailDelegate, MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) UIView *detailView;
@property (nonatomic, retain) UILabel *myLabel;

@end
