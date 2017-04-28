//
//  YJModelTool.m
//  NewsListener
//
//  Created by yj on 17/4/28.
//  Copyright © 2017年 yj. All rights reserved.
//

#import "YJModelTool.h"

@implementation YJModelTool

+(void)createModelWithDictionary:(NSDictionary *)dict modelName:(NSString *)modelName
{
    printf("\n@interface %s :NSObject\n",modelName.UTF8String);
    for (NSString *key in dict) {
        NSString *type = ([dict[key] isKindOfClass:[NSNumber class]])?@"NSNumber":@"NSString";
        printf("@property (nonatomic,copy) %s *%s;\n",type.UTF8String,key.UTF8String);
    }
    printf("@end\n");
    
    
}
@end
