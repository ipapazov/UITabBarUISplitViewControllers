//
//  StoriesViewController_IPhone.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "StoriesViewController_IPhone.h"
#import "FavoritesViewController_IPhone.h"

@implementation StoriesViewController_IPhone
@synthesize storiesView;

- (id)init
{
    self = [super init];
    if (self) {
        
        // Custom initialization
        self.title = @"Stories";
        self.tabBarItem = [[UITabBarItem alloc] 
                           initWithTitle:@"Stories" image:[UIImage imageNamed:@"GoldStar"] tag:1];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] 
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                target:self 
                                action:@selector(addStories:)];
        
        self.navigationItem.rightBarButtonItem = bbi;
        [bbi release]; bbi = nil;
         
        
    }
    return self;
}

-(void)addStories:(id)sender
{
    FavoritesViewController_IPhone  *fvc = [[[FavoritesViewController_IPhone alloc] init] autorelease];
    [self.navigationController pushViewController:fvc animated:YES];
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.storiesView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = storiesView;
    storiesView.backgroundColor = [UIColor orangeColor];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
