//
//  SimpleUndoDemoViewController.m
//  SimpleUndoDemo
//
//  Created by crossmo/yangcun on 14/10/30.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "SimpleUndoDemoViewController.h"

@interface SimpleUndoDemoViewController ()

@end

@implementation SimpleUndoDemoViewController
@synthesize contentLabel = _contentLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _contentLabel.text = [NSString stringWithFormat:@"%@", @0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender
{
    NSInteger number =  [_contentLabel.text integerValue];
    NSString *content = [NSString stringWithFormat:@"%d", ++number];
    CGFloat fontSize = _contentLabel.font.pointSize;
    [self setContentLabelText:content andFontSize:++fontSize];
}

- (void)setContentLabelText:(NSString *)content
{
    [self.undoManager registerUndoWithTarget:self
                                    selector:@selector(setContentLabelText:)
                                      object:content];
    [self.undoManager setActionName:@"text undo"];
    self.contentLabel.text = content;
}

- (void)setContentLabelText:(NSString *)newContent andFontSize:(CGFloat) newFontSize
{
    
    [[self.undoManager prepareWithInvocationTarget:self] setContentLabelText:self.contentLabel.text
                                                                 andFontSize:self.contentLabel.font.pointSize];
    [self.undoManager setActionName:@"undo text and size"];
    self.contentLabel.text = newContent;
    self.contentLabel.font = [UIFont systemFontOfSize:newFontSize];
}
- (IBAction)undo:(id)sender
{
    if ([self.undoManager canUndo]) {
        [self.undoManager undo];
    }
}

@end
