//
//  KKViewController.m
//  KoboldKitDemo
//
//  Created by Steffen Itterheim on 13.06.13.
//  Copyright (c) 2013 Steffen Itterheim. All rights reserved.
//

#import "KKViewController.h"
#import "SKNode+KoboldKit.h"
#import "KKView.h"
#import "JRSwizzle.h"

@interface KKViewController ()

@end

@implementation KKViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
	
	[self swizzleMethods];
	
    // Configure the view.
	KKView* kkView = (KKView*)self.view;
	NSAssert1([kkView isKindOfClass:[KKView class]],
			  @"KKViewController: view must be of class KKView, but its class is: %@. You may need to change this in your code or in Interface Builder (Identity Inspector -> Custom Class).",
			  NSStringFromClass([kkView class]));
	
	kkView.showsFPS = YES;
	kkView.showsDrawCount = YES;
	kkView.showsNodeCount = YES;
}

-(void) checkSwizzleError:(NSError*)error
{
	NSAssert1(error == nil, @"Method swizzling error: %@", error);
}

-(void) swizzleMethods
{
	/*
	// swizzle some methods to hook into Sprite Kit
	NSError* error;
	
	[SKNode jr_swizzleMethod:@selector(copyWithZone:)
				  withMethod:@selector(kkCopyWithZone:) error:&error];
	[self checkSwizzleError:error];
	*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@dynamic kkView;
-(KKView*) kkView
{
	return (KKView*)self.view;
}

@end