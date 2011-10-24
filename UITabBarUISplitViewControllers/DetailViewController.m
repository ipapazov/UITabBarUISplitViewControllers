//
//  DetailViewController.m
//  UITabBarUISplitViewControllers
//
//  Created by Hristo Papazov on 10/23/11.
//  Copyright (c) 2011 University of Chicago. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController
@synthesize detailView;
@synthesize myLabel;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"Detial";

        // Add custom UIBarButton to send email
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
    // Set my detail view properties
    self.detailView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = detailView;
    detailView.backgroundColor = [UIColor greenColor];
    
    // Add label
    myLabel = [[UILabel alloc] initWithFrame: CGRectMake(480, 80, 320, 80)];
    [myLabel setLineBreakMode:UILineBreakModeWordWrap];
    [myLabel setNumberOfLines:0];
    [myLabel setFont:[UIFont fontWithName:@"Helvetica" size:(26.00)]];
    [myLabel setTextAlignment:UITextAlignmentLeft];
    [myLabel setTextColor:[UIColor orangeColor]];
    [myLabel setBackgroundColor:[UIColor greenColor]];
    
    [detailView addSubview: myLabel];
    [myLabel release]; 

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

- (void)splitViewController:(UISplitViewController *)svc 
     willHideViewController:(UIViewController *)aViewController 
          withBarButtonItem:(UIBarButtonItem *)barButtonItem 
       forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];   
    
}

- (void)splitViewController:(UISplitViewController *)svc 
     willShowViewController:(UIViewController *)aViewController 
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

- (void)masterDetailChanged:(id)sender
{
    NSDate *date_time = [NSDate date];
    
    // Initialize gregorian calendar object
    NSCalendar *greg_calndr = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    //Get the date and time components 
    NSDateComponents *dt_comps = [greg_calndr components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:date_time];
    
    // Set date and time variables
    NSInteger day = [dt_comps day];
    NSInteger month = [dt_comps month];
    NSInteger year = [dt_comps year];
    NSInteger hour = [dt_comps hour];
    NSInteger minute = [dt_comps minute];
    NSInteger second = [dt_comps second];  
    
    //Destroy gregorian calendar object
    [greg_calndr release];
    
    //Set the text attribute for the 'timeLable
    myLabel.text = [NSString stringWithFormat:@"Date: %02d-%02d-%02d\nTime: %02d:%02d:%02d", day, month, year, hour, minute, second];
    
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
