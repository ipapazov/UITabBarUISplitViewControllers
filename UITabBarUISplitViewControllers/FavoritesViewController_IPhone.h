//
//  FavoritesViewController_IPhone.h
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface FavoritesViewController_IPhone : UIViewController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) UIView *favoritesView;

@end
