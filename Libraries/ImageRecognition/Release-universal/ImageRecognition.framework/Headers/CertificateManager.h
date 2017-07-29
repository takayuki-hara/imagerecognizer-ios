//
//  CertificateManager.h
//  docomo-oauth-ios-sdk
//  (c) 2014 NTT DOCOMO, INC. All Rights Reserved.
//

#import <Foundation/Foundation.h>

/** 証明書管理クラス */
@interface CertificateManager : NSObject
{
    SecCertificateRef rootCertificate;
    NSMutableArray *rootCertificateArray;
}

+ (CertificateManager *)sharedInstance;
- (SecCertificateRef)getRootCertificate:(NSString *)certPath
                            fingerPrint:(NSString *)fingerPrint;
- (NSMutableArray *)getRootCertificateList;

@end
