//
//  GoogleViewController.m
//  Oskar2011
//
//  Created by shustreek on 29.02.16.
//  Copyright (c) 2016 shustreek. All rights reserved.
//

#import "GoogleViewController.h"

@interface GoogleViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GoogleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.scalesPageToFit = YES;
    
    NSString *fullURL = @"http://google.pl";
    
    NSURL *url = [NSURL URLWithString:fullURL];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];

    [self.webView loadRequest:requestObj];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
