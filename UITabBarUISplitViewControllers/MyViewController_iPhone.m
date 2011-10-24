//
//  MyViewController_iPhone.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "MyViewController_iPhone.h"
#import "StoriesViewController_IPhone.h"
#import "FavoritesViewController_IPhone.h"

@implementation MyViewController_iPhone
@synthesize mainView;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = mainView;
    
    // Create two view controllers - Stories and Favorites
    StoriesViewController_IPhone *svc = [[StoriesViewController_IPhone alloc] init];
    UINavigationController *snvc = [[[UINavigationController alloc] 
                                     initWithRootViewController:svc] autorelease];
    
    
    FavoritesViewController_IPhone *fvc = [[FavoritesViewController_IPhone alloc] init];
    UINavigationController *fnvc = [[[UINavigationController alloc] 
                                     initWithRootViewController:fvc] autorelease];
    
    // Add the view controlers to an array
    NSArray *viewControllers = [NSArray arrayWithObjects:snvc, fnvc, nil];
    [svc release]; svc=nil;
    [fvc release]; fvc=nil;
    
    // Set up tab bar and add it to the sub view
    UITabBarController *tbc = [[UITabBarController alloc] init];
    [tbc setViewControllers:viewControllers];
    [self.mainView addSubview:tbc.view];

}


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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
