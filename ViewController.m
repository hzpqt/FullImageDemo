//
//  ViewController.m
//  FullImageDemo
//
//  Created by pqt on 16/3/11.
//  Copyright © 2016年 pqt. All rights reserved.
//

#import "ViewController.h"
#import "FullImageView.h"
#import "TestTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    
    if (!cell)
    {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:self options:nil];
        cell = array[0];
    }
    
    NSString *strImageName = [NSString stringWithFormat:@"%ld",indexPath.row%2];
    
    [cell setCellContent:[UIImage imageNamed:strImageName]];
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
    {
        return 108;
    }
    
    return 133;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[self.tableView  cellForRowAtIndexPath:indexPath];
    
    UIImageView *imageView = cell.imageView;
    
    CGRect pidImageViewOriginFrame =CGRectMake(cell.frame.origin.x+imageView.frame.origin.x, cell.frame.origin.y+imageView.frame.origin.y-self.tableView.contentOffset.y/*如果有导航条，要再加64*/, imageView.frame.size.width, imageView.frame.size.height);
    
     FullImageView *fullImageView = [[FullImageView alloc] initWithFrame:CGRectMake(0, 0, Screen_width, Screen_height) withImage:imageView.image withTarget:self withSEL:@selector(lookOriginalImageButtonClicked:) withOriginFrame:pidImageViewOriginFrame];
    fullImageView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.9f];
    
    if (![fullImageView superview])
    {
        [fullImageView showInView:self.view.window];
    }
}

-(void)lookOriginalImageButtonClicked:(UIButton *)btn
{
    NSLog(@"查看原图");
}
@end
