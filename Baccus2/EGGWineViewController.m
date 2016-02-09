//
//  EGGWineViewController.m
//  Baccus2
//
//  Created by Eduardo on 03/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import "EGGWineViewController.h"
#import "EGGWebViewController.h"

@interface EGGWineViewController ()

@end

@implementation EGGWineViewController

// con initWithNibName: bundle: le decimos donde esta la vista. En este caso el valor por defecto, con el mismo nombre que la clase y en la carpeta principal
// con la asignacion de valor a la variable _model le decimos quien es el modelo

-(id) initWithModel: (EGGWineModel *) aModel{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _model = aModel;
        //ponemos el tittle al controller
        self.title = aModel.name;
    }
    return self;
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //Impide que la barra Navigation este por encima de la View. No es el metodo correcto!!
    self.edgesForExtendedLayout = UIRectEdgeNone;

}

// El controlador sincroniza modelo y vista
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //llamamos a un metodo que creamos nosotros para presentar en las vistas los datos del modelo
    [self syncModelWithView];
    
    //Cambiar el color de la barra
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.66
                                                                        green:0.21
                                                                         blue:0.20
                                                                        alpha:1.0];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender{
    
    //hacemos que muestre la web. Creamos un webViewController
    EGGWebViewController *webVC = [[EGGWebViewController alloc] initWithModel:self.model];
    //hacemos un push
    [self.navigationController pushViewController:webVC animated:YES];
    
}

#pragma mark - Utils

-(void) syncModelWithView{
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    
    [self displayRating: self.model.rating];
    
    [self.notesLabel setNumberOfLines:0];
    
    
    
}

-(void) clearRatings{
    
    for (UIImageView *imgView in self.ratingViews){
        imgView.image = nil;
    }
}
-(void) displayRating: (int) aRating{
    
    [self clearRatings];
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    for (int i = 0; i < aRating; i++) {
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
    
}

//creamos el metodo para devolver la lista de tipos de uva

-(NSString *) arrayToString: (NSArray *) anArray{
    
    NSString *repr = nil;
    
    if ([anArray count] == 1){
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }else {
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    return repr;
}

#pragma mark - UISplitViewControllerDelegate


//Aparece el boton cuando giramos en vertical el iPad y oculta el controlador de tabla
-(void)splitViewController:(UISplitViewController *)svc
    willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc{
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
}

//Para la posicion apaisada muestra el controlador de tabla y quitamos el boton
-(void)splitViewController:(UISplitViewController *)svc
    willShowViewController:(UIViewController *)aViewController
 invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    self.navigationItem.rightBarButtonItem = nil;
    
}

#pragma mark - WineryTableViewControllerDelegate

-(void)wineryTableViewController:(EGGWineryTableViewController *)wineryVC
                   didSelectWine:(EGGWineModel *)aWine{
    
    self.model = aWine;
    self.title = aWine.name;
    
    //Sincronizamos las vistas
    [self syncModelWithView];
    
}

@end






