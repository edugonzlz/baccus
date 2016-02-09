//
//  EGGWineryTableViewController.h
//  Baccus2
//
//  Created by Eduardo on 10/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGGWineryModel.h"
//Definicion de constantes
#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

#define DID_SELECT_WINE_NOTIFICATION_NAME @"newWineSelected"
//Definimos la clave bajo la que se guarda el vino en el NSDictionary de la notificacion
#define WINE_KEY @"wine"

#define  SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWine"

@class EGGWineryTableViewController;

//Definimos un protocolo nuevo que enviara mensajes al WineViewController para cambiar la info de la vista cuando seleccionamos un nuevo vino en la TableView
@protocol WineryTableViewControllerDelegate <NSObject>

-(void)wineryTableViewController:(EGGWineryTableViewController *)wineryVC
                   didSelectWine:(EGGWineModel *)aWine;

@end

@interface EGGWineryTableViewController : UITableViewController

//Añadimos la propiedad de delegado, imprescindible en objetos que son delegados
@property (weak, nonatomic) id <WineryTableViewControllerDelegate> delegate;

@property (strong, nonatomic) EGGWineryModel *model;

-(id)initWithModel: (EGGWineryModel *) aModel
             style:(UITableViewStyle) aStyle;

-(EGGWineModel *)lastSelectedWine;

@end

