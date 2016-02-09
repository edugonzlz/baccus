//
//  EGGWineViewController.h
//  Baccus2
//
//  Created by Eduardo on 03/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGGWineModel.h"
#import "EGGWineryTableViewController.h"

@interface EGGWineViewController : UIViewController <UISplitViewControllerDelegate, WineryTableViewControllerDelegate>

@property (strong, nonatomic) EGGWineModel *model;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak,nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

-(id) initWithModel: (EGGWineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
