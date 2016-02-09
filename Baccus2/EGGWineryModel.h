//
//  EGGWineryModel.h
//  Baccus2
//
//  Created by Eduardo on 10/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EGGWineModel.h"

@interface EGGWineryModel : NSObject

//usamos readonly para que nadie nos cambie el numero de vinos del array, por lo que tenemos que crear nuestros getters
@property (readonly, nonatomic) int redWineCount;
@property (readonly, nonatomic) int whiteWineCount;
@property (readonly, nonatomic) int otherWineCount;

//creamos un objeto Wine que esta en cierta posicion
-(EGGWineModel *) redWineAtIndex: (int)index;
-(EGGWineModel *) whiteWineAtIndex: (int)index;
-(EGGWineModel *) otherWineAtIndex: (int)index;

@end
