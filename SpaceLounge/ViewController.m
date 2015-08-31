//
//  ViewController.m
//  SpaceLounge
//
//  Created by BoHeon Jeong on 8/12/15.
//  Copyright (c) 2015 BoHeon Jeong. All rights reserved.
//

#import "ViewController.h"
#import "Parse/parse.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UILabel *welcome;
@property (weak, nonatomic) IBOutlet UIButton *fbButton;
@property (weak, nonatomic) IBOutlet UIButton *twtButton;
@property (weak, nonatomic) IBOutlet UIButton *linkButton;
@property (weak, nonatomic) IBOutlet UIButton *googButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *idText;
@property (weak, nonatomic) IBOutlet UITextField *pwText;

@end

@implementation ViewController

- (void)viewDidLoad {
  //  [_fbButton setBackgroundImage:"fb.png" forState:UIControlStateNormal];
    [_fbButton setBackgroundImage:[UIImage imageNamed:@"facebook1.png"] forState:UIControlStateNormal];
    [_twtButton setBackgroundImage:[UIImage imageNamed:@"twitter.png"] forState:UIControlStateNormal];
    [_linkButton setBackgroundImage:[UIImage imageNamed:@"linkedin-icon.png"] forState:UIControlStateNormal];
    [_googButton setBackgroundImage:[UIImage imageNamed:@"google.png"] forState:UIControlStateNormal];
    
    _idText.leftViewMode = UITextFieldViewModeAlways;
    _idText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"id.png"]];
    _pwText.leftViewMode = UITextFieldViewModeAlways;
    _pwText.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pass.png"]];

    [super viewDidLoad];
}
- (IBAction)login:(id)sender {
   // [self performSegueWithIdentifier:@"loginO" sender:sender];

    NSString *usrID = _idText.text;
    NSString *usrPW = _pwText.text;
    [PFUser logInWithUsernameInBackground:usrID password:usrPW block:^(PFUser *user, NSError *error) {
        if(user){
            NSLog(@"login successful");
             [self performSegueWithIdentifier:@"loginO" sender:sender];
            // Now application displays the Profile Page
        }
        else{
            NSLog(@"Log in failed");
            // Ask for re-input of either username or password
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
