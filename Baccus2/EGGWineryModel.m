//
//  EGGWineryModel.m
//  Baccus2
//
//  Created by Eduardo on 10/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import "EGGWineryModel.h"


@interface EGGWineryModel ()

//creamos unas propiedades ocultas o privadas

@property (strong,nonatomic) NSArray *redWines;
@property (strong,nonatomic) NSArray *whiteWines;
@property (strong,nonatomic) NSArray *otherWines;

@end

@implementation EGGWineryModel

#pragma mark - Properties
//implementamos los getters para el numero de vinos
-(int)redWineCount{
    
    return [self.redWines count];
}
-(int)whiteWineCount{
    
    return [self.whiteWines count];
}

-(int)otherWineCount{
    
    return [self.otherWines count];
}

-(id) init{
    
    if (self = [super init]){
        
        EGGWineModel *tintorro = [EGGWineModel wineWithName:@"Bembirre"
                                            wineCompanyName:@"Dominio de Tares"
                                                       type:@"Tinto"
                                                     origin:@"El Bierzo"
                                                     grapes:@[@"Mencia"]
                                             wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com" ]
                                                      notes:@"Este vino es la leche"
                                                     rating:5
                                                      photo:[UIImage imageNamed:@"bembibre.jpg"]];
        EGGWineModel *albarinno = [EGGWineModel wineWithName:@"Zárate"
                                             wineCompanyName:@"Zárate"
                                                        type:@"white"
                                                      origin:@"Rias Bajas"
                                                      grapes:@[@"Albariño"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.albarino-zarate.com"]
                                                       notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                      rating:4
                                                       photo:[UIImage imageNamed:@"zarate.gif"]];
        
        EGGWineModel *champagne = [EGGWineModel wineWithName:@"Comtes de Champagne"
                                             wineCompanyName:@"Champagne Taittinger"
                                                        type:@"other"
                                                      origin:@"Champagne"
                                                      grapes:@[@"Chardonnay"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                       notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                      rating:5
                                                       photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];
        
        //Creamos los tres arrays, en este caso con un solo elemento cada uno
        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
    }
    
    return self;
}


-(EGGWineModel *) redWineAtIndex: (int)index{
    //devuelve el objeto que hay en el index que nos entreguen del array redWines
    return [self.redWines objectAtIndex:index];
}
-(EGGWineModel *) whiteWineAtIndex: (int)index{
    return [self.whiteWines objectAtIndex:index];
}
-(EGGWineModel *) otherWineAtIndex: (int)index{
    return [self.otherWines objectAtIndex:index];
}

@end
