//
//  KKCollectionModel.m
//  DePoint
//
//  Created by kaki on 16/8/3.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKCollectionModel.h"

@implementation KKCollectionModel
static NSString *collectionmodel_colPlace       = @"collectionmodel_colPlace      ";
static NSString *collectionmodel_symptomtext    = @"collectionmodel_symptomtext   ";
static NSString *collectionmodel_drugtext       = @"collectionmodel_drugtext      ";
static NSString *collectionmodel_colStatus      = @"collectionmodel_colStatus     ";
static NSString *collectionmodel_colSymptom     = @"collectionmodel_colSymptom    ";
static NSString *collectionmodel_caretext       = @"collectionmodel_caretext      ";
static NSString *collectionmodel_url            = @"collectionmodel_url           ";
static NSString *collectionmodel_img            = @"collectionmodel_img           ";
static NSString *collectionmodel_colCount       = @"collectionmodel_colCount      ";
static NSString *collectionmodel_checktext      = @"collectionmodel_checktext     ";
static NSString *collectionmodel_colDisease     = @"collectionmodel_colDisease    ";
static NSString *collectionmodel_foodtext       = @"collectionmodel_foodtext      ";
static NSString *collectionmodel_keywords       = @"collectionmodel_keywords      ";
static NSString *collectionmodel_name           = @"collectionmodel_name          ";
static NSString *collectionmodel_fcount         = @"collectionmodel_fcount        ";
static NSString *collectionmodel_food           = @"collectionmodel_food          ";
static NSString *collectionmodel_causetext      = @"collectionmodel_causetext     ";
static NSString *collectionmodel_diseasetext    = @"collectionmodel_diseasetext   ";
static NSString *collectionmodel_colId          = @"collectionmodel_colId         ";
static NSString *collectionmodel_colDepartment  = @"collectionmodel_colDepartment ";
static NSString *collectionmodel_rcount         = @"collectionmodel_rcount        ";
static NSString *collectionmodel_colMessage     = @"collectionmodel_colMessage    ";
static NSString *collectionmodel_checks         = @"collectionmodel_checks        ";
static NSString *collectionmodel_colDrug        = @"collectionmodel_colDrug       ";
static NSString *collectionmodel_colDescription = @"collectionmodel_colDescription";
static NSString *collectionmodel_remarks        = @"collectionmodel_remarks";
static NSString *collectionmodel_saveDate       = @"collectionmodel_saveDate";

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject  :self.colPlace       forKey:collectionmodel_colPlace      ];
    [aCoder encodeObject  :self.symptomtext    forKey:collectionmodel_symptomtext   ];
    [aCoder encodeObject  :self.drugtext       forKey:collectionmodel_drugtext      ];
    [aCoder encodeBool    :self.colStatus      forKey:collectionmodel_colStatus     ];
    [aCoder encodeObject  :self.colSymptom     forKey:collectionmodel_colSymptom    ];
    [aCoder encodeObject  :self.caretext       forKey:collectionmodel_caretext      ];
    [aCoder encodeObject  :self.url            forKey:collectionmodel_url           ];
    [aCoder encodeObject  :self.img            forKey:collectionmodel_img           ];
    [aCoder encodeInteger :self.colCount       forKey:collectionmodel_colCount      ];
    [aCoder encodeObject  :self.checktext      forKey:collectionmodel_checktext     ];
    [aCoder encodeObject  :self.colDisease     forKey:collectionmodel_colDisease    ];
    [aCoder encodeObject  :self.foodtext       forKey:collectionmodel_foodtext      ];
    [aCoder encodeObject  :self.keywords       forKey:collectionmodel_keywords      ];
    [aCoder encodeObject  :self.name           forKey:collectionmodel_name          ];
    [aCoder encodeInteger :self.fcount         forKey:collectionmodel_fcount        ];
    [aCoder encodeObject  :self.food           forKey:collectionmodel_food          ];
    [aCoder encodeObject  :self.causetext      forKey:collectionmodel_causetext     ];
    [aCoder encodeObject  :self.diseasetext    forKey:collectionmodel_diseasetext   ];
    [aCoder encodeInteger :self.colId          forKey:collectionmodel_colId         ];
    [aCoder encodeObject  :self.colDepartment  forKey:collectionmodel_colDepartment ];
    [aCoder encodeInteger :self.rcount         forKey:collectionmodel_rcount        ];
    [aCoder encodeObject  :self.colMessage     forKey:collectionmodel_colMessage    ];
    [aCoder encodeObject  :self.checks         forKey:collectionmodel_checks        ];
    [aCoder encodeObject  :self.colDrug        forKey:collectionmodel_colDrug       ];
    [aCoder encodeObject  :self.colDescription forKey:collectionmodel_colDescription];
    [aCoder encodeObject  :self.remarks        forKey:collectionmodel_remarks];
    [aCoder encodeObject  :self.saveDate       forKey:collectionmodel_saveDate];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self.colPlace       = [aDecoder decodeObjectForKey :collectionmodel_colPlace      ];
    self.symptomtext    = [aDecoder decodeObjectForKey :collectionmodel_symptomtext   ];
    self.drugtext       = [aDecoder decodeObjectForKey :collectionmodel_drugtext      ];
    self.colStatus      = [aDecoder decodeBoolForKey   :collectionmodel_colStatus     ];
    self.colSymptom     = [aDecoder decodeObjectForKey :collectionmodel_colSymptom    ];
    self.caretext       = [aDecoder decodeObjectForKey :collectionmodel_caretext      ];
    self.url            = [aDecoder decodeObjectForKey :collectionmodel_url           ];
    self.img            = [aDecoder decodeObjectForKey :collectionmodel_img           ];
    self.colCount       = [aDecoder decodeIntegerForKey:collectionmodel_colCount      ];
    self.checktext      = [aDecoder decodeObjectForKey :collectionmodel_checktext     ];
    self.colDisease     = [aDecoder decodeObjectForKey :collectionmodel_colDisease    ];
    self.foodtext       = [aDecoder decodeObjectForKey :collectionmodel_foodtext      ];
    self.keywords       = [aDecoder decodeObjectForKey :collectionmodel_keywords      ];
    self.name           = [aDecoder decodeObjectForKey :collectionmodel_name          ];
    self.fcount         = [aDecoder decodeIntegerForKey:collectionmodel_fcount        ];
    self.food           = [aDecoder decodeObjectForKey :collectionmodel_food          ];
    self.causetext      = [aDecoder decodeObjectForKey :collectionmodel_causetext     ];
    self.diseasetext    = [aDecoder decodeObjectForKey :collectionmodel_diseasetext   ];
    self.colId          = [aDecoder decodeIntegerForKey:collectionmodel_colId         ];
    self.colDepartment  = [aDecoder decodeObjectForKey :collectionmodel_colDepartment ];
    self.rcount         = [aDecoder decodeIntegerForKey:collectionmodel_rcount        ];
    self.colMessage     = [aDecoder decodeObjectForKey :collectionmodel_colMessage    ];
    self.checks         = [aDecoder decodeObjectForKey :collectionmodel_checks        ];
    self.colDrug        = [aDecoder decodeObjectForKey :collectionmodel_colDrug       ];
    self.colDescription = [aDecoder decodeObjectForKey :collectionmodel_colDescription];
    self.remarks        = [aDecoder decodeObjectForKey :collectionmodel_remarks];
    self.saveDate       = [aDecoder decodeObjectForKey :collectionmodel_saveDate];
    return self;
}
@end
