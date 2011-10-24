//
//  FavoritesViewController_IPhone.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "FavoritesViewController_IPhone.h"
#import "StoriesViewController_IPhone.h"

@implementation FavoritesViewController_IPhone
@synthesize favoritesView;

- (id)init
{
    self = [super init];
    if (self) {
        
        // Custom initialization
        
        self.title = @"Favorites";
        self.tabBarItem = [[UITabBarItem alloc] 
                           initWithTitle:@"Favorites" image:[UIImage imageNamed:@"GoldStar"] tag:2];

        // Add custom UIBarButton to Favorites Navigation Bar
        UIBarButtonItem *sbi =  [[UIBarButtonItem alloc] initWithTitle:@"Share" style:UIBarButtonItemStylePlain target:self action:@selector(shareFavorites:)];                              
                                 
        self.navigationItem.rightBarButtonItem = sbi;
        [sbi release]; sbi = nil;
    
    }
    return self;
}

// Method to run when "Share" button pressed
-(void)shareFavorites:(id)sender
{
    MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
    mailComposeViewController.mailComposeDelegate = self;
    [mailComposeViewController setToRecipients:[NSArray arrayWithObjects:@"email address", nil]];
    [mailComposeViewController setSubject:@"Subject"];
    [mailComposeViewController setMessageBody:@"Body" isHTML:YES];
    [self.navigationController presentModalViewController:mailComposeViewController animated:YES];
    [mailComposeViewController release];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: Canceled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: Saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: Sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: Failled");
            break;            
        default:
            NSLog(@"Result: Not Sent");
            break;
    }
    [controller dismissModalViewControllerAnimated:YES];
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.favoritesView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = favoritesView;
    favoritesView.backgroundColor = [UIColor greenColor];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

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
