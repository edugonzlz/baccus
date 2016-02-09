//
//  EGGWineModel.h
//  Baccus2
//
//  Created by Eduardo on 03/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NO_RATING -1

@interface EGGWineModel : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *origin;
@property (nonatomic) int rating; //va de 0 a 5
@property (strong, nonatomic) NSArray *grapes;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wineCompanyName;

//Constructor de conveniencia o Metodos de clase

+(id) wineWithName: (NSString*)aName
   wineCompanyName: (NSString*)aWineCompayName
              type: (NSString*) aType
            origin: (NSString*) anOrigin
            grapes: (NSArray*) arrayOfGrapes
    wineCompanyWeb: (NSURL*) aURL
             notes: (NSString*) aNotes
            rating: (int) aRating
             photo: (UIImage*)aPhoto;

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString*) aWineCompanyName
              type: (NSString*) aType
            origin: (NSString*) anOrigin;


//Inicializador Designado

-(id) initWithName: (NSString *)aName
   wineCompanyName: (NSString*)aWineCompayName
              type: (NSString*) aType
            origin: (NSString*) anOrigin
            grapes: (NSArray*) arrayOfGrapes
    wineCompanyWeb: (NSURL*) aURL
             notes: (NSString*) aNotes
            rating: (int) aRating
             photo: (UIImage*)aPhoto;

//Inicializador de conveniencia

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString*) aWineCompanyName
              type: (NSString*) aType
            origin: (NSString*) anOrigin;

@end
