//
//  SimpleUndoDemoViewController.h
//  SimpleUndoDemo
//
//  Created by crossmo/yangcun on 14/10/30.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleUndoDemoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

- (IBAction)add:(id)sender;
- (IBAction)undo:(id)sender;

@end
