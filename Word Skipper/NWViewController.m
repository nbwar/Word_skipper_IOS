//
//  NWViewController.m
//  Word Skipper
//
//  Created by Nicholas Wargnier on 10/23/13.
//  Copyright (c) 2013 Nicholas Wargnier. All rights reserved.
//

#import "NWViewController.h"

@interface NWViewController ()

@property (strong, nonatomic) IBOutlet UIStepper *selectedWordStepper;
@property (strong, nonatomic) IBOutlet UILabel *selectedWordLabel;

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation NWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateSelectedWord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

-(NSArray *)wordList
{
    NSArray *wordList = [[self.label.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([wordList count]) {
        return wordList;
    } else {
        return @[@""];
    }
}

-(NSString *)selectedWord
{
    return [self wordList][(int)self.selectedWordStepper.value];
}

- (IBAction)updateSelectedWord {
    self.selectedWordStepper.maximumValue = [[self wordList] count] - 1;
    self.selectedWordLabel.text = [self selectedWord];
}


@end
