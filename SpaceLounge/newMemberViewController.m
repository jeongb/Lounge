//
//  newMemberViewController.m
//  SpaceLounge
//
//  Created by BoHeon Jeong on 8/13/15.
//  Copyright (c) 2015 BoHeon Jeong. All rights reserved.
//

#import "newMemberViewController.h"

@interface newMemberViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UITextField *bitrh;
@property (weak, nonatomic) IBOutlet UITextField *sex;

@end

@implementation newMemberViewController

- (void)viewDidLoad {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    label.text= @" Name : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _name.leftViewMode = UITextFieldViewModeAlways;
    _name.leftView = label;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    label.text= @" User ID : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _userID.leftViewMode = UITextFieldViewModeAlways;
    _userID.leftView = label;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    label.text= @" Password : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _password.leftViewMode = UITextFieldViewModeAlways;
    _password.leftView = label;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    label.text= @" Password : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _password2.leftViewMode = UITextFieldViewModeAlways;
    _password2.leftView = label;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 85, 40)];
    label.text= @" Birthdate : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _bitrh.leftViewMode = UITextFieldViewModeAlways;
    _bitrh.leftView = label;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    label.text= @" Sex : ";
    label.font = [UIFont fontWithName:@"Arial" size:14];
    [label setTextColor:[UIColor orangeColor]];
    _sex.leftViewMode = UITextFieldViewModeAlways;
    _sex.leftView = label;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)register:(id)sender {
    NSString *named = _name.text;
    NSString *usr = _userID.text;
    NSString *pass1 = _password.text;
    NSString *pass2 = _password2.text;
    NSString *birthd = _bitrh.text;
    NSString *sexd = _sex.text;
    
    if(named.length == 0 || usr.length == 0 || pass1.length == 0 || pass2.length == 0){
        NSLog(@"missing info");
    }
    else if(![pass1 isEqualToString:pass2]){
        NSLog(@"Confirm password failed");
    }
    else if(![sexd caseInsensitiveCompare:@"male"] == NSOrderedSame && ![sexd caseInsensitiveCompare:@"female"] == NSOrderedSame){
        NSLog(@"sex type failed");
    }
    else{
        /*for (){
            
        }*/
        
    }
    //else if([birthd characterAtIndex:0] == )
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
