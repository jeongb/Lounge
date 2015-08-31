//
//  PlusViewController.m
//  SpaceLounge
//
//  Created by BoHeon Jeong on 8/31/15.
//  Copyright (c) 2015 BoHeon Jeong. All rights reserved.
//

#import "PlusViewController.h"
#import "Parse/parse.h"

@interface PlusViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *img;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *cam;
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *pic;

@end

@implementation PlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    PFFile *file = currentUser[@"image"];
    
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:file.url]];
    if (file.url == nil) {
        NSLog(@"no image provided");
    }
    else {
        _pic.image = [UIImage imageWithData:imageData];
    }
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [self viewDidLoad];
}
- (IBAction)upload:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
- (IBAction)take:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.pic.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


@end