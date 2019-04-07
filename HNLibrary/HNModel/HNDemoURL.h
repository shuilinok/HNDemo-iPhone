//
//  HNDemoURL.h
//  HNDemo-iPhone
//
//  Created by shuilin on 4/6/19.
//  Copyright © 2019 shuilin. All rights reserved.
//

#ifndef HNDemoURL_h
#define HNDemoURL_h

#define kDemoHost           @"www.xuetangx.com"

#define kBaseUrl            [NSString stringWithFormat:@"http://%@/%@",kDemoHost,@"api/v2"]

#define kCourseSearchUrl    [NSString stringWithFormat:@"%@/search",kBaseUrl]

#endif /* HNDemoURL_h */
