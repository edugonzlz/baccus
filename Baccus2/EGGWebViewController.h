//
//  EGGWebViewController.h
//  Baccus2
//
//  Created by Eduardo on 04/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGGWineModel.h"

@interface EGGWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) EGGWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (EGGWineModel *) aModel;

@end
