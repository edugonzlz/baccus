//
//  EGGWineryTableViewController.m
//  Baccus2
//
//  Created by Eduardo on 10/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import "EGGWineryTableViewController.h"
#import "EGGWineViewController.h"

@interface EGGWineryTableViewController ()

@end

@implementation EGGWineryTableViewController

-(id)initWithModel: (EGGWineryModel *) aModel
             style:(UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]){
        _model = aModel;
        self.title = @"Baccus";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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


#pragma mark - Table view data source

// Le decimos el numero de secciones en la tabla
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//Ponemos el titulo de cada seccion
-(NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    if (section == RED_WINE_SECTION){
        return @"Red Wines";
    }else if (section == WHITE_WINE_SECTION){
        return @"White Wines";
    }else{
        return @"Other Wines";
    }
}
//Definimos el numero de filas(celdas) para cada seccion
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (section == RED_WINE_SECTION){
        return self.model.redWineCount;
    }else if (section == WHITE_WINE_SECTION){
        return self.model.whiteWineCount;
    }else{
        return self.model.otherWineCount;
    }
}
//Creamos y definimos con seran las celdas
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell"; //si hay varios tipos de celda habra una por linea como esta
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell ==nil){
        //creamos la celda a mano si no tiene ninguna
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:CellIdentifier];
    }
    
    // Averiguamos de qué vino se trata AHORA SE PUEDE HACER ASI PORQUE HEMOS CREADO UN METODO wineForIndexPath
    EGGWineModel *wine = [self wineForIndexPath:indexPath];

    //Averiguar de que modelo nos estan hablando
    /*EGGWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    */
    
    //Sincronizamos celda (vista) y vino (modelo)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView 
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 //ANTES DE LA SECCION DE PERSISTENCIA EN EL CURSO
 
#pragma mark - Table View delegate

//Presentamos la vista segun el usuario seleccione la celda
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Suponemos que estamos dentro de un Navigation Controller
    
    //Averiguamos de que vino se trata
    EGGWineModel *wine = nil;
    if (indexPath.section == RED_WINE_SECTION){
        wine = [self.model redWineAtIndex:indexPath.row];
    }else if (indexPath.section == WHITE_WINE_SECTION){
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }else{
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    //Enviamos el mensaje al delegado, EGGWineViewController, para que cambie el vino
    [self.delegate wineryTableViewController:self
                               didSelectWine:wine];
    
    //Creamos tambien una notificacion al WebViewController para que cambie cuando seleccionamos otro vino
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                       object:self
                                                     userInfo:@{WINE_KEY: wine}];
                         
                         
                         //y Enviamos de la notificacion
                         [[NSNotificationCenter defaultCenter] postNotification:n];
    

}
*/
#pragma mark - Table View delegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Escogemos el vino seleccionado
    EGGWineModel *wine = [self wineForIndexPath:indexPath];
    
    // Avisar al delegado
    [self.delegate wineryTableViewController:self
                               didSelectWine:wine];
    
    //Creamos la notificacion
    NSNotification *n = [NSNotification notificationWithName:DID_SELECT_WINE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{WINE_KEY: wine}];
    // Enviar notificación
    [[NSNotificationCenter defaultCenter] postNotification:n];
    
    // Guardar el último vino seleccionado
    [self saveLastSelectedWineAtSection:indexPath.section
                                    row:indexPath.row];
}

#pragma mark -  Utils

// Averiguar de qué vino se trata
- (EGGWineModel *)wineForIndexPath:(NSIndexPath *)indexPath
{
    EGGWineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}

#pragma mark - NSUserDefaults

//guardar por defecto el primero de los vinos
- (NSDictionary *)setDefaults{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //por defecto guardamos el primero de los tintos
    NSDictionary *defaultWineCoords = @{SECTION_KEY : @(RED_WINE_SECTION), ROW_KEY : @0};
    
    //lo asignamos
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    //guardamos por si acaso
    [defaults synchronize];
    
    return defaultWineCoords;
}

//guardar el ultimo vino seleccionado, seccion y fila
- (void)saveLastSelectedWineAtSection:(NSUInteger)section
                                  row:(NSUInteger)row{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY : @(section), ROW_KEY : @(row)}
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize];
}

//recuperar el ultimo vino seleccionado y guardado
- (EGGWineModel *)lastSelectedWine{
    
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults]objectForKey:LAST_WINE_KEY];
    
    if (coords == nil) {
        //No hay nada bajo la clave LAST_WINE_KEY
        //ESto quiere decir que es la primera vez que se abre la app
        //Ponemos un valor por defecto: el primero de los tintos
        coords = [self setDefaults];
    }else{
        //ya hay algo, es decir, en algun momento se guardó
        //no hay nada especial que hacer
    }
    
    //Transformamos esas coodenadas en un indexpath
    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey: ROW_KEY] integerValue] //integer value nos transforma el NSNumber que devuelve el diccionario en un entero
                                   inSection:[[coords objectForKey: SECTION_KEY] integerValue]];
    
    //devolvemos el vino en cuestion
    return [self wineForIndexPath:indexPath];
}

@end
