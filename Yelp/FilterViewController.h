//
//  FilterViewController.h
//  Yelp
//
//  Created by Jason Huang on 6/21/15.
//  Copyright (c) 2015 Jason Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onCancelButton:(id)sender;




@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray *_pickerData;

@end
