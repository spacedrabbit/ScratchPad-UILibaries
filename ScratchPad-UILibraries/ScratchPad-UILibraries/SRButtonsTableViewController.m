//
//  SRButtonsTableViewController.m
//  ScratchPad-UILibraries
//
//  Created by Louis Tur on 5/16/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

#import "SRButtonsTableViewController.h"
#import <VBFPopFlatButton/VBFPopFlatButton.h>

static NSString * const SRVBFPopFlatButton = @"VBFPopFlatButton";

static NSString * const SRVBPopFlatButtonCellIndentifier = @"popCell";

typedef NS_ENUM(NSInteger, SRButtonsSectionIndex){
    SRVBFPopFlatButtonSection = 0,
};

@interface SRButtonsTableViewController ()

@property (strong, nonatomic) NSArray *libraries;
@property (strong, nonatomic) NSDictionary *librariesMap;

@property (strong, nonatomic) NSDictionary *popButtonTypes;

@end

@implementation SRButtonsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.libraries = @[SRVBFPopFlatButton];
    self.librariesMap = @{ SRVBFPopFlatButton : @[@"example 1", @"example 2", @"example 3"]
                           };
    self.tableView.estimatedRowHeight = 44.0;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SRVBPopFlatButtonCellIndentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSDictionary *)popButtonTypes{
    return @{ @"default" : @(buttonDefaultType),
              @"add"   : @(buttonAddType),
              @"minus" : @(buttonMinusType),
              @"close" : @(buttonCloseType),
              @"back" : @(buttonBackType),
              @"forward" : @(buttonForwardType),
              @"menu": @(buttonMenuType),
              @"download" : @(buttonDownloadType),
              @"share" : @(buttonShareType),
              @"downBasic" : @(buttonDownBasicType),
              @"upBasic" : @(buttonUpBasicType),
              @"pause" : @(buttonPausedType),
              @"rightTri" : @(buttonRightTriangleType),
              @"leftTri" : @(buttonLeftTriangleType),
              @"upTri" : @(buttonUpTriangleType),
              @"downTri" : @(buttonDownTriangleType),
              @"ok" : @(buttonOkType),
              @"rewind" : @(buttonRewindType),
              @"fastForward": @(buttonFastForwardType),
              @"square" : @(buttonSquareType) };
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.libraries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = 1;
    
    switch (section) {
        case SRVBFPopFlatButtonSection:
            numberOfRows = ((NSArray *)self.librariesMap[SRVBFPopFlatButton]).count;
            break;
            
        default:
            break;
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    if (!cell) {
        switch (indexPath.section) {
            case SRVBFPopFlatButtonSection:{
                cell = [tableView dequeueReusableCellWithIdentifier:SRVBPopFlatButtonCellIndentifier];
                
                if (indexPath.row == 0) {
                    VBFPopFlatButton *demoButton = [[VBFPopFlatButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)
                                                                                buttonType:buttonMenuType
                                                                               buttonStyle:buttonRoundedStyle
                                                                     animateToInitialState:YES];
                    demoButton.tintColor = [UIColor redColor];
                    [demoButton addTarget:self action:@selector(animateRandomly:) forControlEvents:UIControlEventTouchUpInside];
                    
                    [cell.contentView addSubview:demoButton];
                    
                    NSArray *constraints = @[ [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button]" options:0 metrics:nil views:@{ @"button" : demoButton }],
                                              [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[button]|" options:0 metrics:nil views:@{ @"button" : demoButton }] ];
                    [cell.contentView addConstraints:constraints[0]];
                    [cell.contentView addConstraints:constraints[1]];
                }
                else if (indexPath.row == 1){
                    VBFPopFlatButton *demoButton = [[VBFPopFlatButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)
                                                                                buttonType:buttonMenuType
                                                                               buttonStyle:buttonRoundedStyle
                                                                     animateToInitialState:YES];
                    demoButton.tintColor = [UIColor redColor];
                    demoButton.roundBackgroundColor = [UIColor blueColor];
                    demoButton.lineThickness = 3.0;
                    [demoButton addTarget:self action:@selector(animateRandomly:) forControlEvents:UIControlEventTouchUpInside];

                    [cell.contentView addSubview:demoButton];
                    
                    NSArray *constraints = @[ [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button]" options:0 metrics:nil views:@{ @"button" : demoButton }],
                                              [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[button]|" options:0 metrics:nil views:@{ @"button" : demoButton }] ];
                    [cell.contentView addConstraints:constraints[0]];
                    [cell.contentView addConstraints:constraints[1]];
                }
                else{
                    NSMutableArray *constraintsArray = [[NSMutableArray alloc] init];
                    VBFPopFlatButton *demoButton = [[VBFPopFlatButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)
                                                                                buttonType:buttonMenuType
                                                                               buttonStyle:buttonRoundedStyle
                                                                     animateToInitialState:YES];
                    UIView *containerView = [[UIView alloc] initWithFrame:CGRectZero];
                    
                    /* Ultimately what semi-works for the VBFlat buttons is that
                     
                     1) The frame has to be set to a defined value at instatiation
                     2) Autoresizing Mask has to be set to NO
                     3) Constraints need to be added
                     4) Constraints much not conflict with the frame size defined at instantiation
                     
                     Though, clearly this is not a perfect solution and it seems the library is explicitly meant to be used with frames and not autolayout
                     
                     */
                    [containerView setTranslatesAutoresizingMaskIntoConstraints:NO];
                    [demoButton setTranslatesAutoresizingMaskIntoConstraints:NO];
                    
                    [cell.contentView addSubview:containerView];
                    [containerView addSubview:demoButton];
                    
                    demoButton.lineThickness = 4.0;
                    demoButton.tintColor = [UIColor blueColor];
                    [demoButton addTarget:self action:@selector(animateRandomly:) forControlEvents:UIControlEventTouchUpInside];
                    
                    NSArray *btnVertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(>=44.0)]" options:0 metrics:nil views:@{ @"view" : demoButton }];
                    NSArray *btnHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(>=44.0)]" options:0 metrics:nil views:@{ @"view": demoButton}];
                    NSLayoutConstraint *demoCenterX = [NSLayoutConstraint constraintWithItem:demoButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
                    NSLayoutConstraint *demoCenterY = [NSLayoutConstraint constraintWithItem:demoButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
                    [containerView addConstraints:@[demoCenterY, demoCenterX]];
                    [demoButton addConstraints:btnHorizontal];
                    [demoButton addConstraints:btnVertical];
                    
                    
                    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[view(>=60.0)]-|" options:0 metrics:nil views:@{ @"view" : containerView }];
                    NSArray *horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(>=60.0)]" options:0 metrics:nil views:@{ @"view": containerView}];
                    NSLayoutConstraint *dimension = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
                    NSLayoutConstraint *centeredX = [NSLayoutConstraint constraintWithItem:demoButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
                    NSLayoutConstraint *centeredY = [NSLayoutConstraint constraintWithItem:demoButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:containerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
                    
                    [constraintsArray addObjectsFromArray:vertical];
                    [constraintsArray addObjectsFromArray:horizontal];
                    [constraintsArray addObjectsFromArray:@[dimension, centeredX, centeredY]];
                    
                    [cell.contentView addConstraints:constraintsArray];
                }
                
                break;
            }
            default:
                break;
        }
    }
    return cell;
}

- (void) animateRandomly:(VBFPopFlatButton *)sender {
   
    int randomVal = arc4random_uniform(20);
    
    [sender animateToType:(FlatButtonType)randomVal];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *titleForHeader;
    switch (section) {
        case SRVBFPopFlatButtonSection:
            titleForHeader = SRVBFPopFlatButton;
            break;
            
        default:
            titleForHeader = @"None";
            break;
    }
    return titleForHeader;
}


@end
