//
//  RootViewController.m
//  SSHUDViewBug
//
//  Created by Henrik Hodne on 11/7/12.
//  Copyright (c) 2012 Henrik Hodne. All rights reserved.
//

#import "RootViewController.h"

#import <SSToolkit/SSHUDView.h>

@interface RootViewController ()

@property (strong) UITextField *textField;
@property (strong) UIButton *button;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	self.view.backgroundColor = UIColor.whiteColor;

	CGSize size = self.view.frame.size;

	self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 70.0f, size.width - 20.0f, 30.0f)];
	self.textField.placeholder = @"Text Field";
	self.textField.borderStyle = UITextBorderStyleRoundedRect;
	[self.view addSubview:self.textField];

	self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	self.button.frame = CGRectMake(10.0f, 110.0f, size.width - 20.0f, 30.0f);
	[self.button setTitle:@"Press me" forState:UIControlStateNormal];
	[self.button addTarget:self action:@selector(buttonWasPushed) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.button];
}

- (void)buttonWasPushed {
	[self.textField resignFirstResponder];

	SSHUDView *hudView = [[SSHUDView alloc] initWithTitle:@"…"];
	[hudView show];

	[self performSelector:@selector(showAlertOnHUDView:) withObject:hudView afterDelay:0.2];
}

- (void)showAlertOnHUDView:(SSHUDView *)hudView {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title"
														message:@"Message"
													   delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];

	[hudView dismiss];
	[alertView show];
}

@end
