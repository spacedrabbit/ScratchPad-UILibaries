//
//  SRPOPTableViewController.m
//  ScratchPad-UILibraries
//
//  Created by Louis Tur on 5/16/15.
//  Copyright (c) 2015 Louis Tur. All rights reserved.
//

//taken from: http://www.appcoda.com/facebook-pop-framework-intro/
#import "SRPOPTableViewController.h"
#import <pop/POP.h>

// MARK: Custom UITableViewCell -

@interface SRPopTableCell : UITableViewCell

@end

@implementation SRPopTableCell

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
    } else {
        POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.9,0.9)];
        springAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2.0, 2.0)];
        springAnimation.springBounciness = 20.0f;
        [self.textLabel pop_addAnimation:springAnimation forKey:@"springAnimation"];
    }
}

@end

// MARK: Main Tableview implementation

static NSString * const SRPopCellIdentifier = @"cell";

@interface SRPOPTableViewController ()

@property (strong, nonatomic) NSArray *popOptionsArray;

@end

@implementation SRPOPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SRPopTableCell class] forCellReuseIdentifier:SRPopCellIdentifier];
    self.tableView.estimatedRowHeight = 60.0;
    self.popOptionsArray = @[@"Facebook Like", @"Wrong Password", @"Custom VC Transition"];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.popOptionsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:SRPopCellIdentifier forIndexPath:indexPath];
    }
    
    cell.textLabel.text = self.popOptionsArray[indexPath.row];
    
    return cell;
}


@end


