//
//  EGGWebViewController.m
//  Baccus2
//
//  Created by Eduardo on 04/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import "EGGWebViewController.h"
#import "EGGWineryTableViewController.h"

@interface EGGWebViewController ()

@end

@implementation EGGWebViewController

-(id) initWithModel: (EGGWineModel *) aModel{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]){
        _model = aModel;
        //ponemos el title al controller
        self.title = @"Web";
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self displayUrl: self.model.wineCompanyWeb];
    
    //Nos damos de alta el Notification Center solo cuando aparece la vista
    NSNotificationCenter *center= [NSNotificationCenter defaultCenter];
    [center addObserver:self //es quien se suscribe a la notificacon
               selector:@selector(wineDidChange:) //el mensaje que queremos recibir. al pasar un mensaje como parametro de otro hay que pasar el selector
                   name:DID_SELECT_WINE_NOTIFICATION_NAME //el nombre de la notificacion
                 object:nil]; //el que envia la notificacion nil=cualquiera
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //Nos damos de baja en el NotificationCenter cuando desaparece la vista
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//Creamos el metodo que usamos en el alta de notificacion en viewWillApear
- (void)wineDidChange: (NSNotification *) notification{
    
    NSDictionary *dict= [notification userInfo];
    EGGWineModel *newWine = [dict objectForKey:@"wine"]; //en el video pasa la constante WINE_KEY
    
    //Actualizamos el modelo
    self.model = newWine;
    //Mostramos la nueva pagina
    [self displayUrl:self.model.wineCompanyWeb];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (void) webViewDidStartLoad:(UIWebView *)webView{
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityView stopAnimating];
    [self.activityView setHidesWhenStopped:YES];
}

#pragma mark - Utils

- (void) displayUrl: (NSURL *) aURL{
    
    //le decimos a la webView que el WebViewController es su delegado
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
    
}

@end
