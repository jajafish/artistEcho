//
//  JFJamPageViewController.m
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFJamsContainerViewController.h"
#import "JFViewJamsVC.h"

@interface JFJamsContainerViewController ()

@end

@implementation JFJamsContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    [self.pageController.view setFrame:self.view.bounds];
    
    JFViewJamsVC *viewControllerObject = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:viewControllerObject];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [[self view] addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(JFViewJamsVC*)viewController indexNumber];
    
    if (index == 0) {
        
        return nil;
        
    }
    index--;
    return [self viewControllerAtIndex:index];
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(JFViewJamsVC *)viewController indexNumber];
    
    index++;
    if (index > [self.arrJams count]) {
        
        return nil;
        
    }
    return [self viewControllerAtIndex:index];
}

- (JFViewJamsVC*)viewControllerAtIndex:(NSUInteger)index {
    
    JFViewJamsVC *childViewController = [[JFViewJamsVC alloc] initWithNibName:@"JFViewJamsVC" bundle:nil];
    childViewController.indexNumber = index;
    return childViewController;
    
}

/*- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^)(BOOL finished))completion
{
    NSMutableArray *arrVCs = [NSMutableArray array];
    for (NSMutableDictionary *jam in self.arrJams)
    {
        JFViewJamsVC *vc = [[JFViewJamsVC alloc] initWithNibName:@"JFViewJamsVC" bundle:nil];
        vc.data = jam;
        [arrVCs addObject:jam];
    }
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
