//
//  MenuDetailModel.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "category": "2",
 "collectNum": 675,
 "collectid": "",
 "commentNum": 0,
 "content": "材料：面粉250克、豆芽菜、大蒜5瓣、盐、油泼辣子、油、酱油、五香粉1小勺、醋3勺、芝麻酱1小勺、香油1勺做法：面粉里加入水，慢慢揉匀，揉成面团盖上保鲜膜或湿布醒几小时。盆里加入足够的清水，把面团慢慢放在水里揉捏。慢慢清水变白，继续揉捏，洗面。洗二十分钟左右，面水颜色变得更白，洗出面筋。洗好的面筋捞出，放在碗里，上锅蒸半小时。洗好的凉皮面糊静置2小时以上，此时凉皮面糊分离成2层，上层清水，下层面水，把上层清水倒掉。凉皮锣刷一层薄油。舀一勺面糊倒入凉皮慢慢把面糊在凉皮锣里均匀的摊开。锅里提前烧一锅开水，把凉皮锣放入热水里开始蒸凉皮。盖上锅盖，全程大火，约2分钟，表面冒大泡，盖上盖子再闷半分钟到1分钟就好了。提前准备好一盆凉水，把蒸好的凉皮锣放入凉水中冷却。就这样反复蒸，蒸好多凉皮放在篦子上。小贴士：吃的时候切成5毫米左右的宽度，这款凉皮是带面筋的，属于洗面凉皮。小锅里倒入清水，加醋，酱油，五香粉，大料煮开。煮好的大料水过筛，滤掉渣子，调凉皮的调料水就准备好了。把蒜蓉，加一小勺盐，倒少许清水，准备好调凉皮的蒜水。最后吃的时候，倒入调料水，芝麻酱，豆芽菜，淋点辣椒油就好了。醋，酱油不要直接淋在凉皮里，正宗的凉皮调料水很重要，一定要煮开。",
 "contenthtml": "<p><b>材料：</b></p><p>&nbsp;&nbsp;&nbsp;&nbsp;面粉&nbsp;250克、豆芽菜&nbsp;、大蒜&nbsp;5瓣、盐&nbsp;、油泼辣子&nbsp;、油&nbsp;、酱油&nbsp;、五香粉&nbsp;1小勺、醋&nbsp;3勺、芝麻酱&nbsp;1小勺、香油&nbsp;1勺 </p><p><b>做法：</b></p><p></p><ol><li>面粉里加入水，慢慢揉匀，揉成面团盖上保鲜膜或湿布醒几小时。</li><li>盆里加入足够的清水，把面团慢慢放在水里揉捏。</li><li>慢慢清水变白，继续揉捏，洗面。</li><li>洗二十分钟左右，面水颜色变得更白，洗出面筋。</li><li>洗好的面筋捞出，放在碗里，上锅蒸半小时。</li><li>洗好的凉皮面糊静置2小时以上，此时凉皮面糊分离成2层，上层清水，下层面水，把上层清水倒掉。</li><li>凉皮锣刷一层薄油。</li><li>舀一勺面糊倒入凉皮</li><li>慢慢把面糊在凉皮锣里均匀的摊开。</li><li>锅里提前烧一锅开水，把凉皮锣放入热水里开始蒸凉皮。</li><li>盖上锅盖，全程大火，约2分钟，表面冒大泡，盖上盖子再闷半分钟到1分钟就好了。</li><li>提前准备好一盆凉水，把蒸好的凉皮锣放入凉水中冷却。就这样反复蒸，蒸好多凉皮放在篦子上。</li></ol><p></p><p><b>小贴士：</b></p><p></p><ol><li>吃的时候切成5毫米左右的宽度，这款凉皮是带面筋的，属于洗面凉皮。</li><li>小锅里倒入清水，加醋，酱油，五香粉，大料煮开。煮好的大料水过筛，滤掉渣子，调凉皮的调料水就准备好了。把蒜蓉，加一小勺盐，倒少许清水，准备好调凉皮的蒜水。最后吃的时候，倒入调料水，芝麻酱，豆芽菜，淋点辣椒油就好了。</li><li>醋，酱油不要直接淋在凉皮里，正宗的凉皮调料水很重要，一定要煮开。</li></ol><p></p>",
 */
@interface MenuDetailModel : NSObject
@property(nonatomic,copy)NSString *category;
@property(nonatomic,copy)NSString *collectNum;
@property(nonatomic,copy)NSString *collectid;
@property(nonatomic,copy)NSString *commentNum;
@property(nonatomic,copy)NSString *content;

@property(nonatomic,copy)NSString *ctype;
@property(nonatomic,copy)NSArray *discussionPoList;
@property(nonatomic,copy)NSString *editid;
@property(nonatomic,copy)NSString *editname;
@property(nonatomic,copy)NSNumber *enjoyNum;
/*
 "ctype": "",
 "discussionPoList": [
 {
 "commentid": "",
 "contentid": "116801",
 "discussion": "调料说得不够细",
 "distime": "2014-07-08 01:24:41",
 "id": "6416230",
 "pic": "5933112",
 "uid": "5933111",
 "username": "",
 "usertitle": "芳子_qq_552003",
 "weiboid": "6416231"
 },],
 "editid": "",
 "editname": "",
 "enjoyNum": 0,*/
@property(nonatomic,copy)NSNumber *evaluationPo;
 
 /*
 "evaluationPo": null,
 "flower": 0,
 "gettime": {
 "date": 23,
 "day": 4,
 "hours": 22,
 "minutes": 59,
 "month": 7,
 "nanos": 0,
 "seconds": 51,
 "time": 1345733991000,
 "timezoneOffset": -480,
 "year": 112
 },
 "havebom": "",
 "id": "116801",
 "imageSizePo": {
 "high": 726,
 "imageid": "770446",
 "width": 526
 },
 "imageid": "770446",
 "imageidList": [
 "770446"
 ],
 "isrec": "",
 "materialList": [
 {
 "contentid": "116801",
 "dosage": "250克",
 "id": "82886",
 "mwikipediaid": "118370",
 "name": "面粉",
 "ordernum": 1,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "",
 "id": "82887",
 "mwikipediaid": "",
 "name": "豆芽菜",
 "ordernum": 2,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "5瓣",
 "id": "82888",
 "mwikipediaid": "113864",
 "name": "大蒜",
 "ordernum": 3,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "",
 "id": "82889",
 "mwikipediaid": "81600",
 "name": "盐",
 "ordernum": 4,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "",
 "id": "82890",
 "mwikipediaid": "",
 "name": "油泼辣子",
 "ordernum": 5,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "",
 "id": "82891",
 "mwikipediaid": "113769",
 "name": "油",
 "ordernum": 6,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "",
 "id": "82892",
 "mwikipediaid": "81630",
 "name": "酱油",
 "ordernum": 7,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "1小勺",
 "id": "82893",
 "mwikipediaid": "81667",
 "name": "五香粉",
 "ordernum": 8,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "3勺",
 "id": "82894",
 "mwikipediaid": "81639",
 "name": "醋",
 "ordernum": 9,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "1小勺",
 "id": "82895",
 "mwikipediaid": "81699",
 "name": "芝麻酱",
 "ordernum": 10,
 "version": 0
 },
 {
 "contentid": "116801",
 "dosage": "1勺",
 "id": "82896",
 "mwikipediaid": "81602",
 "name": "香油",
 "ordernum": 11,
 "version": 0
 }
 ],
 "name": "陕西正宗洗面凉皮",
 "qqChinaPo": null,
 "referencePo": {
 "author": "茗月baby",
 "contentid": "116801",
 "editname": "",
 "id": "770463",
 "title": "陕西正宗洗面凉皮",
 "url": "http://hoto.cn/recipe/34115",
 "version": "1"
 },
 "sortCommonPo": null,
 "state": "",
 "stepList": [
 {
 "contentid": "116801",
 "details": "面粉里加入水，慢慢揉匀，揉成面团盖上保鲜膜或湿布醒几小时。",
 "id": "63261",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "盆里加入足够的清水，把面团慢慢放在水里揉捏。",
 "id": "63262",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "慢慢清水变白，继续揉捏，洗面。",
 "id": "63263",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "洗二十分钟左右，面水颜色变得更白，洗出面筋。",
 "id": "63264",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "洗好的面筋捞出，放在碗里，上锅蒸半小时。",
 "id": "63265",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "洗好的凉皮面糊静置2小时以上，此时凉皮面糊分离成2层，上层清水，下层面水，把上层清水倒掉。",
 "id": "63266",
 "imageid": "",
 "ordernum": 0,
 "time": 120,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "凉皮锣刷一层薄油。",
 "id": "63267",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "舀一勺面糊倒入凉皮",
 "id": "63268",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "慢慢把面糊在凉皮锣里均匀的摊开。",
 "id": "63269",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "锅里提前烧一锅开水，把凉皮锣放入热水里开始蒸凉皮。",
 "id": "63270",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "盖上锅盖，全程大火，约2分钟，表面冒大泡，盖上盖子再闷半分钟到1分钟就好了。",
 "id": "63271",
 "imageid": "",
 "ordernum": 0,
 "time": 2,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "提前准备好一盆凉水，把蒸好的凉皮锣放入凉水中冷却。就这样反复蒸，蒸好多凉皮放在篦子上。",
 "id": "63272",
 "imageid": "",
 "ordernum": 0,
 "time": 0,
 "version": 0
 }
 ],
 "tagsPoList": [
 {
 "id": "133",
 "name": "主食",
 "ord": 0,
 "tagid": "133",
 "typeid": "133",
 "typename": "主食"
 },
 {
 "id": "98",
 "name": "面粉",
 "ord": 0,
 "tagid": "98",
 "typeid": "133",
 "typename": "谷类"
 }
 ],
 "tipsList": [
 {
 "contentid": "116801",
 "details": "吃的时候切成5毫米左右的宽度，这款凉皮是带面筋的，属于洗面凉皮。",
 "id": "8990",
 "ordernum": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "小锅里倒入清水，加醋，酱油，五香粉，大料煮开。煮好的大料水过筛，滤掉渣子，调凉皮的调料水就准备好了。把蒜蓉，加一小勺盐，倒少许清水，准备好调凉皮的蒜水。最后吃的时候，倒入调料水，芝麻酱，豆芽菜，淋点辣椒油就好了。",
 "id": "8991",
 "ordernum": 0,
 "version": 0
 },
 {
 "contentid": "116801",
 "details": "醋，酱油不要直接淋在凉皮里，正宗的凉皮调料水很重要，一定要煮开。",
 "id": "8992",
 "ordernum": 0,
 "version": 0
 }
 ],
 "type": "hoto",
 "url": "http://www.ecook.cn/ecook/viewContent.shtml?id=116801",
 "version": 1,
 "wpo": null
 }
 */
@property(nonatomic,copy)NSString *
@end
