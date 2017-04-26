//
//  NSString+KSOFontAwesomeExtensions.m
//  KSOFontAwesomeExtensions
//
//  Created by William Towe on 3/28/17.
//  Copyright © 2017 Kosoku Interactive, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "NSString+KSOFontAwesomeExtensions.h"

#import <CoreText/CoreText.h>

const struct KSOFontAwesomeIdentifier KSOFontAwesomeIdentifier = {
    .icon500PX = @"fa-500px",
    .iconAddressBook = @"fa-address-book",
    .iconAddressBookO = @"fa-address-book-o",
    .iconAddressCard = @"fa-address-card",
    .iconAddressCardO = @"fa-address-card-o",
    .iconAdjust = @"fa-adjust",
    .iconADN = @"fa-adn",
    .iconAlignCenter = @"fa-align-center",
    .iconAlignJustify = @"fa-align-justify",
    .iconAlignLeft = @"fa-align-left",
    .iconAlignRight = @"fa-align-right",
    .iconAmazon = @"fa-amazon",
    .iconAmbulance = @"fa-ambulance",
    .iconAmericanSignLanguageInterpreting = @"fa-american-sign-language-interpreting",
    .iconAnchor = @"fa-anchor",
    .iconAndroid = @"fa-android",
    .iconAngelList = @"fa-angellist",
    .iconAngleDoubleDown = @"fa-angle-double-down",
    .iconAngleDoubleLeft = @"fa-angle-double-left",
    .iconAngleDoubleRight = @"fa-angle-double-right",
    .iconAngleDoubleUp = @"fa-angle-double-up",
    .iconAngleDown = @"fa-angle-down",
    .iconAngleLeft = @"fa-angle-left",
    .iconAngleRight = @"fa-angle-right",
    .iconAngleUp = @"fa-angle-up",
    .iconApple = @"fa-apple",
    .iconArchive = @"fa-archive",
    .iconAreaChart = @"fa-area-chart",
    .iconArrowCircleDown = @"fa-arrow-circle-down",
    .iconArrowCircleLeft = @"fa-arrow-circle-left",
    .iconArrowCircleRight = @"fa-arrow-circle-right",
    .iconArrowCircleUp = @"fa-arrow-circle-up",
    .iconArrowCircleDownO = @"fa-arrow-circle-o-down",
    .iconArrowCircleLeftO = @"fa-arrow-circle-o-left",
    .iconArrowCircleRightO = @"fa-arrow-circle-o-right",
    .iconArrowCircleUpO = @"fa-arrow-circle-o-up",
    .iconArrowDown = @"fa-arrow-down",
    .iconArrowLeft = @"fa-arrow-left",
    .iconArrowRight = @"fa-arrow-right",
    .iconArrowUp = @"fa-arrow-up",
    .iconArrows = @"fa-arrows",
    .iconArrowsAlt = @"fa-arrows-alt",
    .iconArrowsHorizontal = @"fa-arrows-h",
    .iconArrowsVertical = @"fa-arrows-v",
    .iconAssistiveListeningSystems = @"fa-assistive-listening-systems",
    .iconAsterisk = @"fa-asterisk",
    .iconAt = @"fa-at",
    .iconAudioDescription = @"fa-audio-description",
    .iconBackward = @"fa-backward",
    .iconBalanceScale = @"fa-balance-scale",
    .iconBan = @"fa-ban",
    .iconBandcamp = @"fa-bandcamp",
    .iconBarChart = @"fa-bar-chart",
    .iconBarcode = @"fa-barcode",
    .iconBars = @"fa-bars",
    .iconBath = @"fa-bath",
    .iconBatteryEmpty = @"fa-battery-empty",
    .iconBatteryFull = @"fa-battery-full",
    .iconBatteryHalf = @"fa-battery-half",
    .iconBatteryQuarter = @"fa-battery-quarter",
    .iconBatteryThreeQuarters = @"fa-battery-three-quarters",
    .iconBed = @"fa-bed",
    .iconBeer = @"fa-beer",
    .iconBehance = @"fa-behance",
    .iconBehanceSquare = @"fa-behance-square",
    .iconBell = @"fa-bell",
    .iconBellO = @"fa-bell-o",
    .iconBellSlash = @"fa-bell-slash",
    .iconBellSlashO = @"fa-bell-slash-o",
    .iconBicycle = @"fa-bicycle",
    .iconBinoculars = @"fa-binoculars",
    .iconBirthdayCake = @"fa-birthday-cake",
    .iconBitbucket = @"fa-bitbucket",
    .iconBitbucketSquare = @"fa-bitbucket-square",
    .iconBlackTie = @"fa-black-tie",
    .iconBlind = @"fa-blind",
    .iconBluetooth = @"fa-bluetooth",
    .iconBluetoothB = @"fa-bluetooth-b",
    .iconBold = @"fa-bold",
    .iconBolt = @"fa-bolt",
    .iconBomb = @"fa-bomb",
    .iconBook = @"fa-book",
    .iconBookmark = @"fa-bookmark",
    .iconBookmarkO = @"fa-bookmark-o",
    .iconBraille = @"fa-braille",
    .iconBriefcase = @"fa-briefcase",
    .iconBTC = @"fa-btc",
    .iconBug = @"fa-bug",
    .iconBuilding = @"fa-building",
    .iconBuildingO = @"fa-building-o",
    .iconBullhorn = @"fa-bullhorn",
    .iconBullseye = @"fa-bullseye",
    .iconBus = @"fa-bus",
    .iconBuySellAds = @"fa-buysellads",
    .iconCalculator = @"fa-calculator",
    .iconCalendar = @"fa-calendar",
    .iconCalendarO = @"fa-calendar-o",
    .iconCalendarCheckO = @"fa-calendar-check-o",
    .iconCalendarMinusO = @"fa-calendar-minus-o",
    .iconCalendarPlusO = @"fa-calendar-plus-o",
    .iconCalendarTimesO = @"fa-calendar-times-o",
    
    .iconCog = @"fa-cog",
    .iconFire = @"fa-fire",
    .iconHeart = @"fa-heart",
    
    .iconPlus = @"fa-plus",
    .iconQuestionCircleO = @"fa-question-circle-o",
    .iconStar = @"fa-star",
    .iconUser = @"fa-user"
};

const struct KSOFontAwesomeString KSOFontAwesomeString = {
    .icon500PX = @"\uf26e",
    .iconAddressBook = @"\uf2b9",
    .iconAddressBookO = @"\uf2ba",
    .iconAddressCard = @"\uf2bb",
    .iconAddressCardO = @"\uf2bc",
    .iconAdjust = @"\uf042",
    .iconADN = @"\uf170",
    .iconAlignCenter = @"\uf037",
    .iconAlignJustify = @"\uf039",
    .iconAlignLeft = @"\uf036",
    .iconAlignRight = @"\uf038",
    .iconAmazon = @"\uf270",
    .iconAmbulance = @"\uf0f9",
    .iconAmericanSignLanguageInterpreting = @"\uf2a3",
    .iconAnchor = @"\uf13d",
    .iconAndroid = @"\uf17b",
    .iconAngelList = @"\uf209",
    .iconAngleDoubleDown = @"\uf103",
    .iconAngleDoubleLeft = @"\uf100",
    .iconAngleDoubleRight = @"\uf101",
    .iconAngleDoubleUp = @"\uf102",
    .iconAngleDown = @"\uf107",
    .iconAngleLeft = @"\uf104",
    .iconAngleRight = @"\uf105",
    .iconAngleUp = @"\uf106",
    .iconApple = @"\uf179",
    .iconArchive = @"\uf187",
    .iconAreaChart = @"\uf1fe",
    .iconArrowCircleDown = @"\uf0ab",
    .iconArrowCircleLeft = @"\uf0a8",
    .iconArrowCircleRight = @"\uf0a9",
    .iconArrowCircleUp = @"\uf0aa",
    .iconArrowCircleDownO = @"\uf01a",
    .iconArrowCircleLeftO = @"\uf190",
    .iconArrowCircleRightO = @"\uf18e",
    .iconArrowCircleUpO = @"\uf01b",
    .iconArrowDown = @"\uf063",
    .iconArrowLeft = @"\uf060",
    .iconArrowRight = @"\uf061",
    .iconArrowUp = @"\uf062",
    .iconArrows = @"\uf047",
    .iconArrowsAlt = @"\uf0b2",
    .iconArrowsHorizontal = @"\uf07e",
    .iconArrowsVertical = @"\uf07d",
    .iconAssistiveListeningSystems = @"\uf2a2",
    .iconAsterisk = @"\uf069",
    .iconAt = @"\uf1fa",
    .iconAudioDescription = @"\uf29e",
    .iconBackward = @"\uf04a",
    .iconBalanceScale = @"\uf24e",
    .iconBan = @"\uf05e",
    .iconBandcamp = @"\uf2d5",
    .iconBarChart = @"\uf080",
    .iconBarcode = @"\uf02a",
    .iconBars = @"\uf0c9",
    .iconBath = @"\uf2cd",
    .iconBatteryEmpty = @"\uf244",
    .iconBatteryFull = @"\uf240",
    .iconBatteryHalf = @"\uf242",
    .iconBatteryQuarter = @"\uf243",
    .iconBatteryThreeQuarters = @"\uf241",
    .iconBed = @"\uf236",
    .iconBeer = @"\uf0fc",
    .iconBehance = @"\uf1b4",
    .iconBehanceSquare = @"\uf1b5",
    .iconBell = @"\uf0f3",
    .iconBellO = @"\uf0a2",
    .iconBellSlash = @"\uf1f6",
    .iconBellSlashO = @"\uf1f7",
    .iconBicycle = @"\uf206",
    .iconBinoculars = @"\uf1e5",
    .iconBirthdayCake = @"\uf1fd",
    .iconBitbucket = @"\uf171",
    .iconBitbucketSquare = @"\uf172",
    .iconBlackTie = @"\uf27e",
    .iconBlind = @"\uf29d",
    .iconBluetooth = @"\uf293",
    .iconBluetoothB = @"\uf294",
    .iconBold = @"\uf032",
    .iconBolt = @"\uf0e7",
    .iconBomb = @"\uf1e2",
    .iconBook = @"\uf02d",
    .iconBookmark = @"\uf02e",
    .iconBookmarkO = @"\uf097",
    .iconBraille = @"\uf2a1",
    .iconBriefcase = @"\uf0b1",
    .iconBTC = @"\uf15a",
    .iconBug = @"\uf188",
    .iconBuilding = @"\uf1ad",
    .iconBuildingO = @"\uf0f7",
    .iconBullhorn = @"\uf0a1",
    .iconBullseye = @"\uf140",
    .iconBus = @"\uf207",
    .iconBuySellAds = @"\uf20d",
    .iconCalculator = @"\uf1ec",
    .iconCalendar = @"\uf073",
    .iconCalendarO = @"\uf133",
    .iconCalendarCheckO = @"\uf274",
    .iconCalendarMinusO = @"\uf272",
    .iconCalendarPlusO = @"\uf271",
    .iconCalendarTimesO = @"\uf273",
    
    .iconCog = @"\uf013",
    .iconFire = @"\uf06d",
    .iconHeart = @"\uf004",
    
    .iconPlus = @"\uf067",
    .iconQuestionCircleO = @"\uf29c",
    .iconStar = @"\uf005",
    .iconUser = @"\uf007"
};

static NSDictionary *kFontAwesomeIconsToIdentifiers;
static NSDictionary *kFontAwesomeIdentifiersToIcons;
static NSDictionary *kFontAwesomeIconsToStrings;
static NSDictionary *kFontAwesomeIdentifiersToStrings;

@interface NSString (KSOFontAwesomePrivateExtensions)
+ (NSString *)_KSO_fontAwesomeIdentifierForIcon:(KSOFontAwesomeIcon)icon;
+ (NSString *)_KSO_fontAwesomeStringForIcon:(KSOFontAwesomeIcon)icon;
@end

@implementation NSString (KSOFontAwesomeExtensions)

+ (void)load {
    NSMutableDictionary *iconsToIdentifiers = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *identifiersToIcons = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *iconsToStrings = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *identifiersToStrings = [[NSMutableDictionary alloc] init];
    
    for (NSInteger i=0; i<KSO_FONT_AWESOME_ICON_TOTAL_ICONS; i++) {
        NSString *identifier = [self _KSO_fontAwesomeIdentifierForIcon:i];
        NSString *string = [self _KSO_fontAwesomeStringForIcon:i];
        
        [iconsToIdentifiers setObject:identifier forKey:@(i)];
        [identifiersToIcons setObject:@(i) forKey:identifier];
        [iconsToStrings setObject:string forKey:@(i)];
        [identifiersToStrings setObject:string forKey:identifier];
    }
    
    kFontAwesomeIconsToIdentifiers = [iconsToIdentifiers copy];
    kFontAwesomeIdentifiersToIcons = [identifiersToIcons copy];
    kFontAwesomeIconsToStrings = [iconsToStrings copy];
    kFontAwesomeIdentifiersToStrings = [identifiersToStrings copy];
    
    for (NSURL *URL in [[NSBundle mainBundle] URLsForResourcesWithExtension:@"ttf" subdirectory:nil]) {
        NSData *data = [NSData dataWithContentsOfURL:URL options:NSDataReadingUncached error:NULL];
        
        if (data == nil) {
            continue;
        }
        
        CGDataProviderRef dataProvider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
        CGFontRef font = CGFontCreateWithDataProvider(dataProvider);
        
        CTFontManagerRegisterGraphicsFont(font, NULL);
        
        CFRelease(font);
        CFRelease(dataProvider);
    }
}

+ (NSString *)KSO_fontAwesomeIdentifierForIcon:(KSOFontAwesomeIcon)icon; {
    return kFontAwesomeIconsToIdentifiers[@(icon)];
}
+ (KSOFontAwesomeIcon)KSO_fontAwesomeIconForIdentifier:(NSString *)identifier; {
    return [kFontAwesomeIdentifiersToIcons[identifier] integerValue];
}

+ (NSString *)KSO_fontAwesomeStringForIcon:(KSOFontAwesomeIcon)icon; {
    return kFontAwesomeIconsToStrings[@(icon)];
}
+ (NSString *)KSO_fontAwesomeStringForIdentifier:(NSString *)identifier; {
    return kFontAwesomeIdentifiersToStrings[identifier];
}

@end

@implementation NSString (KSOFontAwesomePrivateExtensions)

+ (NSString *)_KSO_fontAwesomeIdentifierForIcon:(KSOFontAwesomeIcon)icon; {
    switch (icon) {
        case KSOFontAwesomeIcon500PX:
            return KSOFontAwesomeIdentifier.icon500PX;
        case KSOFontAwesomeIconAddressBook:
            return KSOFontAwesomeIdentifier.iconAddressBook;
        case KSOFontAwesomeIconAddressBookO:
            return KSOFontAwesomeIdentifier.iconAddressBookO;
        case KSOFontAwesomeIconAddressCard:
            return KSOFontAwesomeIdentifier.iconAddressCard;
        case KSOFontAwesomeIconAddressCardO:
            return KSOFontAwesomeIdentifier.iconAddressCardO;
        case KSOFontAwesomeIconAdjust:
            return KSOFontAwesomeIdentifier.iconAdjust;
        case KSOFontAwesomeIconADN:
            return KSOFontAwesomeIdentifier.iconADN;
        case KSOFontAwesomeIconAlignCenter:
            return KSOFontAwesomeIdentifier.iconAlignCenter;
        case KSOFontAwesomeIconAlignJustify:
            return KSOFontAwesomeIdentifier.iconAlignJustify;
        case KSOFontAwesomeIconAlignLeft:
            return KSOFontAwesomeIdentifier.iconAlignLeft;
        case KSOFontAwesomeIconAlignRight:
            return KSOFontAwesomeIdentifier.iconAlignRight;
        case KSOFontAwesomeIconAmazon:
            return KSOFontAwesomeIdentifier.iconAmazon;
        case KSOFontAwesomeIconAmbulance:
            return KSOFontAwesomeIdentifier.iconAmbulance;
        case KSOFontAwesomeIconAmericanSignLanguageInterpreting:
            return KSOFontAwesomeIdentifier.iconAmericanSignLanguageInterpreting;
        case KSOFontAwesomeIconAnchor:
            return KSOFontAwesomeIdentifier.iconAnchor;
        case KSOFontAwesomeIconAndroid:
            return KSOFontAwesomeIdentifier.iconAndroid;
        case KSOFontAwesomeIconAngelList:
            return KSOFontAwesomeIdentifier.iconAngelList;
        case KSOFontAwesomeIconAngleDoubleDown:
            return KSOFontAwesomeIdentifier.iconAngleDoubleDown;
        case KSOFontAwesomeIconAngleDoubleLeft:
            return KSOFontAwesomeIdentifier.iconAngleDoubleLeft;
        case KSOFontAwesomeIconAngleDoubleRight:
            return KSOFontAwesomeIdentifier.iconAngleDoubleRight;
        case KSOFontAwesomeIconAngleDoubleUp:
            return KSOFontAwesomeIdentifier.iconAngleDoubleUp;
        case KSOFontAwesomeIconAngleDown:
            return KSOFontAwesomeIdentifier.iconAngleDown;
        case KSOFontAwesomeIconAngleLeft:
            return KSOFontAwesomeIdentifier.iconAngleLeft;
        case KSOFontAwesomeIconAngleRight:
            return KSOFontAwesomeIdentifier.iconAngleRight;
        case KSOFontAwesomeIconAngleUp:
            return KSOFontAwesomeIdentifier.iconAngleUp;
        case KSOFontAwesomeIconApple:
            return KSOFontAwesomeIdentifier.iconApple;
        case KSOFontAwesomeIconArchive:
            return KSOFontAwesomeIdentifier.iconArchive;
        case KSOFontAwesomeIconAreaChart:
            return KSOFontAwesomeIdentifier.iconAreaChart;
        case KSOFontAwesomeIconArrowCircleDown:
            return KSOFontAwesomeIdentifier.iconArrowCircleDown;
        case KSOFontAwesomeIconArrowCircleLeft:
            return KSOFontAwesomeIdentifier.iconArrowCircleLeft;
        case KSOFontAwesomeIconArrowCircleRight:
            return KSOFontAwesomeIdentifier.iconArrowCircleRight;
        case KSOFontAwesomeIconArrowCircleUp:
            return KSOFontAwesomeIdentifier.iconArrowCircleUp;
        case KSOFontAwesomeIconArrowCircleDownO:
            return KSOFontAwesomeIdentifier.iconArrowCircleDownO;
        case KSOFontAwesomeIconArrowCircleLeftO:
            return KSOFontAwesomeIdentifier.iconArrowCircleLeftO;
        case KSOFontAwesomeIconArrowCircleRightO:
            return KSOFontAwesomeIdentifier.iconArrowCircleRightO;
        case KSOFontAwesomeIconArrowCircleUpO:
            return KSOFontAwesomeIdentifier.iconArrowCircleUpO;
        case KSOFontAwesomeIconArrowDown:
            return KSOFontAwesomeIdentifier.iconArrowDown;
        case KSOFontAwesomeIconArrowLeft:
            return KSOFontAwesomeIdentifier.iconArrowLeft;
        case KSOFontAwesomeIconArrowRight:
            return KSOFontAwesomeIdentifier.iconArrowRight;
        case KSOFontAwesomeIconArrowUp:
            return KSOFontAwesomeIdentifier.iconArrowUp;
        case KSOFontAwesomeIconArrows:
            return KSOFontAwesomeIdentifier.iconArrows;
        case KSOFontAwesomeIconArrowsAlt:
            return KSOFontAwesomeIdentifier.iconArrowsAlt;
        case KSOFontAwesomeIconArrowsHorizontal:
            return KSOFontAwesomeIdentifier.iconArrowsHorizontal;
        case KSOFontAwesomeIconArrowsVertical:
            return KSOFontAwesomeIdentifier.iconArrowsVertical;
        case KSOFontAwesomeIconAssistiveListeningSystems:
            return KSOFontAwesomeIdentifier.iconAssistiveListeningSystems;
        case KSOFontAwesomeIconAsterisk:
            return KSOFontAwesomeIdentifier.iconAsterisk;
        case KSOFontAwesomeIconAt:
            return KSOFontAwesomeIdentifier.iconAt;
        case KSOFontAwesomeIconAudioDescription:
            return KSOFontAwesomeIdentifier.iconAudioDescription;
        case KSOFontAwesomeIconBackward:
            return KSOFontAwesomeIdentifier.iconBackward;
        case KSOFontAwesomeIconBalanceScale:
            return KSOFontAwesomeIdentifier.iconBalanceScale;
        case KSOFontAwesomeIconBan:
            return KSOFontAwesomeIdentifier.iconBan;
        case KSOFontAwesomeIconBandcamp:
            return KSOFontAwesomeIdentifier.iconBandcamp;
        case KSOFontAwesomeIconBarChart:
            return KSOFontAwesomeIdentifier.iconBarChart;
        case KSOFontAwesomeIconBarcode:
            return KSOFontAwesomeIdentifier.iconBarcode;
        case KSOFontAwesomeIconBars:
            return KSOFontAwesomeIdentifier.iconBars;
        case KSOFontAwesomeIconBath:
            return KSOFontAwesomeIdentifier.iconBath;
        case KSOFontAwesomeIconBatteryEmpty:
            return KSOFontAwesomeIdentifier.iconBatteryEmpty;
        case KSOFontAwesomeIconBatteryFull:
            return KSOFontAwesomeIdentifier.iconBatteryFull;
        case KSOFontAwesomeIconBatteryHalf:
            return KSOFontAwesomeIdentifier.iconBatteryHalf;
        case KSOFontAwesomeIconBatteryQuarter:
            return KSOFontAwesomeIdentifier.iconBatteryQuarter;
        case KSOFontAwesomeIconBatteryThreeQuarters:
            return KSOFontAwesomeIdentifier.iconBatteryThreeQuarters;
        case KSOFontAwesomeIconBed:
            return KSOFontAwesomeIdentifier.iconBed;
        case KSOFontAwesomeIconBeer:
            return KSOFontAwesomeIdentifier.iconBeer;
        case KSOFontAwesomeIconBehance:
            return KSOFontAwesomeIdentifier.iconBehance;
        case KSOFontAwesomeIconBehanceSquare:
            return KSOFontAwesomeIdentifier.iconBehanceSquare;
        case KSOFontAwesomeIconBell:
            return KSOFontAwesomeIdentifier.iconBell;
        case KSOFontAwesomeIconBellO:
            return KSOFontAwesomeIdentifier.iconBellO;
        case KSOFontAwesomeIconBellSlash:
            return KSOFontAwesomeIdentifier.iconBellSlash;
        case KSOFontAwesomeIconBellSlashO:
            return KSOFontAwesomeIdentifier.iconBellSlashO;
        case KSOFontAwesomeIconBicycle:
            return KSOFontAwesomeIdentifier.iconBicycle;
        case KSOFontAwesomeIconBinoculars:
            return KSOFontAwesomeIdentifier.iconBinoculars;
        case KSOFontAwesomeIconBirthdayCake:
            return KSOFontAwesomeIdentifier.iconBirthdayCake;
        case KSOFontAwesomeIconBitbucket:
            return KSOFontAwesomeIdentifier.iconBitbucket;
        case KSOFontAwesomeIconBitbucketSquare:
            return KSOFontAwesomeIdentifier.iconBitbucketSquare;
        case KSOFontAwesomeIconBlackTie:
            return KSOFontAwesomeIdentifier.iconBlackTie;
        case KSOFontAwesomeIconBlind:
            return KSOFontAwesomeIdentifier.iconBlind;
        case KSOFontAwesomeIconBluetooth:
            return KSOFontAwesomeIdentifier.iconBluetooth;
        case KSOFontAwesomeIconBluetoothB:
            return KSOFontAwesomeIdentifier.iconBluetoothB;
        case KSOFontAwesomeIconBold:
            return KSOFontAwesomeIdentifier.iconBold;
        case KSOFontAwesomeIconBolt:
            return KSOFontAwesomeIdentifier.iconBolt;
        case KSOFontAwesomeIconBomb:
            return KSOFontAwesomeIdentifier.iconBomb;
        case KSOFontAwesomeIconBook:
            return KSOFontAwesomeIdentifier.iconBook;
        case KSOFontAwesomeIconBookmark:
            return KSOFontAwesomeIdentifier.iconBookmark;
        case KSOFontAwesomeIconBookmarkO:
            return KSOFontAwesomeIdentifier.iconBookmarkO;
        case KSOFontAwesomeIconBraille:
            return KSOFontAwesomeIdentifier.iconBraille;
        case KSOFontAwesomeIconBriefcase:
            return KSOFontAwesomeIdentifier.iconBriefcase;
        case KSOFontAwesomeIconBTC:
            return KSOFontAwesomeIdentifier.iconBTC;
        case KSOFontAwesomeIconBug:
            return KSOFontAwesomeIdentifier.iconBug;
        case KSOFontAwesomeIconBuilding:
            return KSOFontAwesomeIdentifier.iconBuilding;
        case KSOFontAwesomeIconBuildingO:
            return KSOFontAwesomeIdentifier.iconBuildingO;
        case KSOFontAwesomeIconBullhorn:
            return KSOFontAwesomeIdentifier.iconBullhorn;
        case KSOFontAwesomeIconBullseye:
            return KSOFontAwesomeIdentifier.iconBullseye;
        case KSOFontAwesomeIconBus:
            return KSOFontAwesomeIdentifier.iconBus;
        case KSOFontAwesomeIconBuySellAds:
            return KSOFontAwesomeIdentifier.iconBuySellAds;
        case KSOFontAwesomeIconCalculator:
            return KSOFontAwesomeIdentifier.iconCalculator;
        case KSOFontAwesomeIconCalendar:
            return KSOFontAwesomeIdentifier.iconCalendar;
        case KSOFontAwesomeIconCalendarCheckO:
            return KSOFontAwesomeIdentifier.iconCalendarCheckO;
        case KSOFontAwesomeIconCalendarO:
            return KSOFontAwesomeIdentifier.iconCalendarO;
        case KSOFontAwesomeIconCalendarPlusO:
            return KSOFontAwesomeIdentifier.iconCalendarPlusO;
        case KSOFontAwesomeIconCalendarMinusO:
            return KSOFontAwesomeIdentifier.iconCalendarMinusO;
        case KSOFontAwesomeIconCalendarTimesO:
            return KSOFontAwesomeIdentifier.iconCalendarTimesO;
            
        case KSOFontAwesomeIconCog:
            return KSOFontAwesomeIdentifier.iconCog;
        case KSOFontAwesomeIconFire:
            return KSOFontAwesomeIdentifier.iconFire;
        case KSOFontAwesomeIconHeart:
            return KSOFontAwesomeIdentifier.iconHeart;
            
        case KSOFontAwesomeIconPlus:
            return KSOFontAwesomeIdentifier.iconPlus;
        case KSOFontAwesomeIconQuestionCircleO:
            return KSOFontAwesomeIdentifier.iconQuestionCircleO;
        case KSOFontAwesomeIconStar:
            return KSOFontAwesomeIdentifier.iconStar;
        case KSOFontAwesomeIconUser:
            return KSOFontAwesomeIdentifier.iconUser;
        default:
            return nil;
    }
}
+ (NSString *)_KSO_fontAwesomeStringForIcon:(KSOFontAwesomeIcon)icon; {
    switch (icon) {
        case KSOFontAwesomeIcon500PX:
            return KSOFontAwesomeString.icon500PX;
        case KSOFontAwesomeIconAddressBook:
            return KSOFontAwesomeString.iconAddressBook;
        case KSOFontAwesomeIconAddressBookO:
            return KSOFontAwesomeString.iconAddressBookO;
        case KSOFontAwesomeIconAddressCard:
            return KSOFontAwesomeString.iconAddressCard;
        case KSOFontAwesomeIconAddressCardO:
            return KSOFontAwesomeString.iconAddressCardO;
        case KSOFontAwesomeIconAdjust:
            return KSOFontAwesomeString.iconAdjust;
        case KSOFontAwesomeIconADN:
            return KSOFontAwesomeString.iconADN;
        case KSOFontAwesomeIconAlignCenter:
            return KSOFontAwesomeString.iconAlignCenter;
        case KSOFontAwesomeIconAlignJustify:
            return KSOFontAwesomeString.iconAlignJustify;
        case KSOFontAwesomeIconAlignLeft:
            return KSOFontAwesomeString.iconAlignLeft;
        case KSOFontAwesomeIconAlignRight:
            return KSOFontAwesomeString.iconAlignRight;
        case KSOFontAwesomeIconAmazon:
            return KSOFontAwesomeString.iconAmazon;
        case KSOFontAwesomeIconAmbulance:
            return KSOFontAwesomeString.iconAmbulance;
        case KSOFontAwesomeIconAmericanSignLanguageInterpreting:
            return KSOFontAwesomeString.iconAmericanSignLanguageInterpreting;
        case KSOFontAwesomeIconAnchor:
            return KSOFontAwesomeString.iconAnchor;
        case KSOFontAwesomeIconAndroid:
            return KSOFontAwesomeString.iconAndroid;
        case KSOFontAwesomeIconAngelList:
            return KSOFontAwesomeString.iconAngelList;
        case KSOFontAwesomeIconAngleDoubleDown:
            return KSOFontAwesomeString.iconAngleDoubleDown;
        case KSOFontAwesomeIconAngleDoubleLeft:
            return KSOFontAwesomeString.iconAngleDoubleLeft;
        case KSOFontAwesomeIconAngleDoubleRight:
            return KSOFontAwesomeString.iconAngleDoubleRight;
        case KSOFontAwesomeIconAngleDoubleUp:
            return KSOFontAwesomeString.iconAngleDoubleUp;
        case KSOFontAwesomeIconAngleDown:
            return KSOFontAwesomeString.iconAngleDown;
        case KSOFontAwesomeIconAngleLeft:
            return KSOFontAwesomeString.iconAngleLeft;
        case KSOFontAwesomeIconAngleRight:
            return KSOFontAwesomeString.iconAngleRight;
        case KSOFontAwesomeIconAngleUp:
            return KSOFontAwesomeString.iconAngleUp;
        case KSOFontAwesomeIconApple:
            return KSOFontAwesomeString.iconApple;
        case KSOFontAwesomeIconArchive:
            return KSOFontAwesomeString.iconArchive;
        case KSOFontAwesomeIconAreaChart:
            return KSOFontAwesomeString.iconAreaChart;
        case KSOFontAwesomeIconArrowCircleDown:
            return KSOFontAwesomeString.iconArrowCircleDown;
        case KSOFontAwesomeIconArrowCircleLeft:
            return KSOFontAwesomeString.iconArrowCircleLeft;
        case KSOFontAwesomeIconArrowCircleRight:
            return KSOFontAwesomeString.iconArrowCircleRight;
        case KSOFontAwesomeIconArrowCircleUp:
            return KSOFontAwesomeString.iconArrowCircleUp;
        case KSOFontAwesomeIconArrowCircleDownO:
            return KSOFontAwesomeString.iconArrowCircleDownO;
        case KSOFontAwesomeIconArrowCircleLeftO:
            return KSOFontAwesomeString.iconArrowCircleLeftO;
        case KSOFontAwesomeIconArrowCircleRightO:
            return KSOFontAwesomeString.iconArrowCircleRightO;
        case KSOFontAwesomeIconArrowCircleUpO:
            return KSOFontAwesomeString.iconArrowCircleUpO;
        case KSOFontAwesomeIconArrowDown:
            return KSOFontAwesomeString.iconArrowDown;
        case KSOFontAwesomeIconArrowLeft:
            return KSOFontAwesomeString.iconArrowLeft;
        case KSOFontAwesomeIconArrowRight:
            return KSOFontAwesomeString.iconArrowRight;
        case KSOFontAwesomeIconArrowUp:
            return KSOFontAwesomeString.iconArrowUp;
        case KSOFontAwesomeIconArrows:
            return KSOFontAwesomeString.iconArrows;
        case KSOFontAwesomeIconArrowsAlt:
            return KSOFontAwesomeString.iconArrowsAlt;
        case KSOFontAwesomeIconArrowsHorizontal:
            return KSOFontAwesomeString.iconArrowsHorizontal;
        case KSOFontAwesomeIconArrowsVertical:
            return KSOFontAwesomeString.iconArrowsVertical;
        case KSOFontAwesomeIconAssistiveListeningSystems:
            return KSOFontAwesomeString.iconAssistiveListeningSystems;
        case KSOFontAwesomeIconAsterisk:
            return KSOFontAwesomeString.iconAsterisk;
        case KSOFontAwesomeIconAt:
            return KSOFontAwesomeString.iconAt;
        case KSOFontAwesomeIconAudioDescription:
            return KSOFontAwesomeString.iconAudioDescription;
        case KSOFontAwesomeIconBackward:
            return KSOFontAwesomeString.iconBackward;
        case KSOFontAwesomeIconBalanceScale:
            return KSOFontAwesomeString.iconBalanceScale;
        case KSOFontAwesomeIconBan:
            return KSOFontAwesomeString.iconBan;
        case KSOFontAwesomeIconBandcamp:
            return KSOFontAwesomeString.iconBandcamp;
        case KSOFontAwesomeIconBarChart:
            return KSOFontAwesomeString.iconBarChart;
        case KSOFontAwesomeIconBarcode:
            return KSOFontAwesomeString.iconBarcode;
        case KSOFontAwesomeIconBars:
            return KSOFontAwesomeString.iconBars;
        case KSOFontAwesomeIconBath:
            return KSOFontAwesomeString.iconBath;
        case KSOFontAwesomeIconBatteryEmpty:
            return KSOFontAwesomeString.iconBatteryEmpty;
        case KSOFontAwesomeIconBatteryFull:
            return KSOFontAwesomeString.iconBatteryFull;
        case KSOFontAwesomeIconBatteryHalf:
            return KSOFontAwesomeString.iconBatteryHalf;
        case KSOFontAwesomeIconBatteryQuarter:
            return KSOFontAwesomeString.iconBatteryQuarter;
        case KSOFontAwesomeIconBatteryThreeQuarters:
            return KSOFontAwesomeString.iconBatteryThreeQuarters;
        case KSOFontAwesomeIconBed:
            return KSOFontAwesomeString.iconBed;
        case KSOFontAwesomeIconBeer:
            return KSOFontAwesomeString.iconBeer;
        case KSOFontAwesomeIconBehance:
            return KSOFontAwesomeString.iconBehance;
        case KSOFontAwesomeIconBehanceSquare:
            return KSOFontAwesomeString.iconBehanceSquare;
        case KSOFontAwesomeIconBell:
            return KSOFontAwesomeString.iconBell;
        case KSOFontAwesomeIconBellO:
            return KSOFontAwesomeString.iconBellO;
        case KSOFontAwesomeIconBellSlash:
            return KSOFontAwesomeString.iconBellSlash;
        case KSOFontAwesomeIconBellSlashO:
            return KSOFontAwesomeString.iconBellSlashO;
        case KSOFontAwesomeIconBicycle:
            return KSOFontAwesomeString.iconBicycle;
        case KSOFontAwesomeIconBinoculars:
            return KSOFontAwesomeString.iconBinoculars;
        case KSOFontAwesomeIconBirthdayCake:
            return KSOFontAwesomeString.iconBirthdayCake;
        case KSOFontAwesomeIconBitbucket:
            return KSOFontAwesomeString.iconBitbucket;
        case KSOFontAwesomeIconBitbucketSquare:
            return KSOFontAwesomeString.iconBitbucketSquare;
        case KSOFontAwesomeIconBlackTie:
            return KSOFontAwesomeString.iconBlackTie;
        case KSOFontAwesomeIconBlind:
            return KSOFontAwesomeString.iconBlind;
        case KSOFontAwesomeIconBluetooth:
            return KSOFontAwesomeString.iconBluetooth;
        case KSOFontAwesomeIconBluetoothB:
            return KSOFontAwesomeString.iconBluetoothB;
        case KSOFontAwesomeIconBold:
            return KSOFontAwesomeString.iconBold;
        case KSOFontAwesomeIconBolt:
            return KSOFontAwesomeString.iconBolt;
        case KSOFontAwesomeIconBomb:
            return KSOFontAwesomeString.iconBomb;
        case KSOFontAwesomeIconBook:
            return KSOFontAwesomeString.iconBook;
        case KSOFontAwesomeIconBookmark:
            return KSOFontAwesomeString.iconBookmark;
        case KSOFontAwesomeIconBookmarkO:
            return KSOFontAwesomeString.iconBookmarkO;
        case KSOFontAwesomeIconBraille:
            return KSOFontAwesomeString.iconBraille;
        case KSOFontAwesomeIconBriefcase:
            return KSOFontAwesomeString.iconBriefcase;
        case KSOFontAwesomeIconBTC:
            return KSOFontAwesomeString.iconBTC;
        case KSOFontAwesomeIconBug:
            return KSOFontAwesomeString.iconBug;
        case KSOFontAwesomeIconBuilding:
            return KSOFontAwesomeString.iconBuilding;
        case KSOFontAwesomeIconBuildingO:
            return KSOFontAwesomeString.iconBuildingO;
        case KSOFontAwesomeIconBullhorn:
            return KSOFontAwesomeString.iconBullhorn;
        case KSOFontAwesomeIconBullseye:
            return KSOFontAwesomeString.iconBullseye;
        case KSOFontAwesomeIconBus:
            return KSOFontAwesomeString.iconBus;
        case KSOFontAwesomeIconBuySellAds:
            return KSOFontAwesomeString.iconBuySellAds;
        case KSOFontAwesomeIconCalculator:
            return KSOFontAwesomeString.iconCalculator;
        case KSOFontAwesomeIconCalendar:
            return KSOFontAwesomeString.iconCalendar;
        case KSOFontAwesomeIconCalendarCheckO:
            return KSOFontAwesomeString.iconCalendarCheckO;
        case KSOFontAwesomeIconCalendarO:
            return KSOFontAwesomeString.iconCalendarO;
        case KSOFontAwesomeIconCalendarPlusO:
            return KSOFontAwesomeString.iconCalendarPlusO;
        case KSOFontAwesomeIconCalendarMinusO:
            return KSOFontAwesomeString.iconCalendarMinusO;
        case KSOFontAwesomeIconCalendarTimesO:
            return KSOFontAwesomeString.iconCalendarTimesO;
            
        case KSOFontAwesomeIconCog:
            return KSOFontAwesomeString.iconCog;
        case KSOFontAwesomeIconFire:
            return KSOFontAwesomeString.iconFire;
        case KSOFontAwesomeIconHeart:
            return KSOFontAwesomeString.iconHeart;
            
        case KSOFontAwesomeIconPlus:
            return KSOFontAwesomeString.iconPlus;
        case KSOFontAwesomeIconQuestionCircleO:
            return KSOFontAwesomeString.iconQuestionCircleO;
        case KSOFontAwesomeIconStar:
            return KSOFontAwesomeString.iconStar;
        case KSOFontAwesomeIconUser:
            return KSOFontAwesomeString.iconUser;
        default:
            return nil;
    }
}

@end
