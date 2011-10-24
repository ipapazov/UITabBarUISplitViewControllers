//
//  MasterViewController.h
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterDetailDelegate.h"

@interface MasterViewController : UIViewController
{
    id<MasterDetailDelegate> _delegate;
}

@property(nonatomic, assign) id<MasterDetailDelegate> delegate;
@property (nonatomic, retain) UIView *masterView;

@end
