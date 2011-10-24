//
//  MasterViewController.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "MasterViewController.h"
#import "MasterDetailDelegate.h"

@implementation MasterViewController
@synthesize delegate = _delegate;
@synthesize masterView;


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"Master";
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    // Set master view properties
    self.masterView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = masterView;
    masterView.backgroundColor = [UIColor orangeColor];
    
    // Create a button in the master view
    UIButton *update = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    update.frame = CGRectMake(10, 10, 100, 50);
    [update setTitle:[NSString stringWithFormat:@"Udate"]forState:UIControlStateNormal];
    [update addTarget:self action:@selector(masterTouchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [masterView addSubview:update];
    [update release];

    
    // Set the size of the view for popover
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 300.0);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void) deallco
{
    self.delegate =nil;
}

- (void)masterTouchEvent:(id)sender
{
    if (_delegate != nil)
    {
        [_delegate masterDetailChanged:[NSNumber numberWithInt:1]];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
