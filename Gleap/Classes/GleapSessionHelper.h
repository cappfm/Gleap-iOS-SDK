//
//  GleapSessionHelper.h
//  Gleap
//
//  Created by Lukas Boehler on 23.09.21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GleapSession.h"
#import "GleapUserSession.h"

NS_ASSUME_NONNULL_BEGIN

@interface GleapSessionHelper : NSObject

/**
 * Returns a new shared instance of GleapSessionHelper.
 * @author Gleap
 *
 * @return A new shared instance of GleapSessionHelper.
 */
+ (instancetype)sharedInstance;
+ (void)injectSessionInRequest:(NSMutableURLRequest *)request;

- (void)startSessionWith:(void (^)(bool success))completion;
- (void)identifySessionWith:(NSString *)userId andData:(nullable GleapUserSession *)data;
- (void)clearSession;

@property (nonatomic, retain, nullable) GleapSession* currentSession;
@property (nonatomic, retain, nullable) NSDictionary* openIdentityAction;

@end

NS_ASSUME_NONNULL_END
