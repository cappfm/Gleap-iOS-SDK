//
//  GleapAiTool.m
//  
//
//  Created by Lukas Boehler on 08.03.24.
//

#import "GleapAiTool.h"

@implementation GleapAiTool

- (instancetype)initWithName:(NSString *)name
              toolDescription:(NSString *)description
                     response:(NSString *)response
                   parameters:(NSArray<GleapAiToolParameter *> *)parameters {
    if (self = [super init]) {
        _name = name;
        _toolDescription = description;
        _response = response;
        _parameters = parameters;
    }
    return self;
}

- (NSDictionary *)toDictionary {
    NSMutableArray *paramsDictionaries = [NSMutableArray arrayWithCapacity:self.parameters.count];
    for (GleapAiToolParameter *param in self.parameters) {
        [paramsDictionaries addObject:[param toDictionary]];
    }
    
    return @{@"name": self.name,
             @"description": self.toolDescription,
             @"response": self.response,
             @"parameters": [paramsDictionaries copy]};
}

@end
