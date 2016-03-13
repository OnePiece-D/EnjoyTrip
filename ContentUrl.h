//
//  CotentUrl.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#ifndef ContentUrl_h
#define ContentUrl_h

//游记:
#define URL_TravelNote(_page) [NSString stringWithFormat:@"http://chanyouji.com/api/trips/featured.json?page=%ld",_page]

//专题
#define URL_Special(_page) [NSString stringWithFormat:@"http://chanyouji.com/api/articles.json?page=%d",_page]

//二级页面:
//id标识
#define URL_DetailTrips(_userId) [NSString stringWithFormat:@"http://chanyouji.com/api/trips/%@.json",_userId]

//三级页面:
//id标识
#define URL_TripPan(_userId) [NSString stringWithFormat:@"http://chanyouji.com/api/attractions/%@.json",_userId]

//三级页面下的三个button
#define URL_TripPan_Images(_photoId,_page)  [NSString stringWithFormat:@"http://chanyouji.com/api/attractions/photos/%@.json?page=%ld",_photoId,_page]

//游记列表
#define URL_TripPan_List(_listId,_page) [NSString stringWithFormat:@"http://chanyouji.com/api/attractions/%@.json?attraction_trips=true&page=%d",_listId,_page]


//广告:
#define URL_Adverts @"http://chanyouji.com/api/adverts.json?name=app_featured_banner_android"

//广告 --> push:(content)
#define URL_Articles(_adsId) [NSString stringWithFormat:@"http://chanyouji.com/api/articles/%@.json",_adsId]


//专题详情页：

#define URL_articleDetail(_articleId,_page) [NSString stringWithFormat:@"http://chanyouji.com/api/articles/%@.json?page=%d",_articleId,_page]
//580是参数id


#define URL_WebHotlPage(_hotelId) [NSString stringWithFormat:@"http://chanyouji.com/hotels/%@",_hotelId]


//国家攻略:
#define URL_Destinations @"http://chanyouji.com/api/destinations.json"

//push:(id)
#define URL_Destinations_Detail @"http://chanyouji.com/api/destinations/55.json"


//攻略:
#define URL_Destinations_Strategy(_strategyId) [NSString stringWithFormat:@"http://chanyouji.com/api/wiki/destinations/%@.json",_strategyId]


//行程: —>旅行计划
#define URL_Destinations_Plans(_roteId,_page) [NSString stringWithFormat:@"http://chanyouji.com/api/destinations/plans/%@.json?page=%d",_strategyId,_page]

#endif /* ContentUrl_h */
