//
//  NSStringTest.m
//  OCBasic
//
//  Created by liulihua on 17/1/16.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "NSStringTest.h"

@implementation NSStringTest

- (void) test{
#pragma mark *** Initializers ***
//    unichar * charArr = [self testInit];
//    NSLog(@"charArr[0] = %c",charArr[0]); //如果freeWhenDone:YES这里charArr已经被free
#pragma mark *** Substrings ***
//    [self testSubString];
#pragma mark *** String comparison and equality ***
//    [self testEqualString];
#pragma mark *** String search ***
//    [self searchString];
#pragma mark *** Finding lines, sentences, words, etc ***
//    [self stringfind];
#pragma mark *** Character encoding and converting to/from c-string representations ***
    [self encondingString];
    
#pragma mark *** Mutable string ***
    [self multiString];
    
    
}

-(void)multiString{
    NSMutableString *str = [NSMutableString stringWithFormat:@"你好"];
//    [str replaceCharactersInRange:NSMakeRange(1, 2) withString:@"hello"];
//    [str insertString:@"hello" atIndex:str.length+1];
//    NSInteger inx = [str replaceOccurrencesOfString:@"x" withString:@"hello" options:NSCaseInsensitiveSearch range:NSMakeRange(0, str.length)];
    NSRangePointer p = nil;
    BOOL isTure = [str applyTransform:NSStringTransformHiraganaToKatakana reverse:YES range:NSMakeRange(0, str.length) updatedRange:p];
    NSLog(@"%@",str);
    
}


- (void)encondingString{
    
    NSDictionary *dic = @{
                          NSStringEncodingDetectionSuggestedEncodingsKey:@[[NSString stringWithFormat:@"%ld",NSUTF32LittleEndianStringEncoding],@0],
                          NSStringEncodingDetectionUseOnlySuggestedEncodingsKey:@YES
                          };
    NSString *resultStr = nil;
    BOOL lossyConvert;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://baidu.com"]];
    NSStringEncoding encoding = [NSString stringEncodingForData:data encodingOptions:dic convertedString:&resultStr usedLossyConversion:&lossyConvert];
    NSLog(@"encoding:%ld   dic: %@    resultStr:%@   lossyConvert:%d ",encoding,dic,resultStr,lossyConvert);
    
    
    
    
    
    
    NSString *s = @"北京欢迎你";
    
    
    NSString *s1 = [s stringByApplyingTransform:NSStringTransformMandarinToLatin reverse:YES];
    NSString *s2 = [s stringByApplyingTransform:NSStringTransformMandarinToLatin reverse:NO];
    
    
    
    

    NSLog(@"%@    %@",s1,s2);
    
    
    
//    NSArray *strArr = [s componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSString *strArr = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    NSString *strArr = [s stringByPaddingToLength:10 withString:@"abcd" startingAtIndex:2];
    NSString *strArr = [s stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    NSLog(@"%@",strArr);
    
    
    
    
    
    NSString *str = @"hello worl dhellowro ld kk👍kkkkkkk33 dfsafdafdsaf";
    NSString *enc = [NSString localizedNameOfStringEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",enc);
    
    NSString *str1 = [str decomposedStringWithCanonicalMapping];
    NSString *str2 = [str precomposedStringWithCanonicalMapping];
    NSString *str3 = [str decomposedStringWithCompatibilityMapping];
    NSString *str4 = [str precomposedStringWithCompatibilityMapping];
    
    
    NSLog(@"\n str1:%@\n str2:%@\n str3:%@\n str4:%@\n",str1,str2,str3,str4);
}

//Find
- (void)stringfind{
    NSString *str = @"hello worl dhell\nowro ld kk👍kkkkkkk\n33 \ndfsafdafdsaf\n";
    
    [str enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        
        NSLog(@"substring : %@   substringRange: %@  enclosingRange:%@",substring,NSStringFromRange(substringRange),NSStringFromRange(enclosingRange));
        
//        if(substring.length < 5) {
//            *stop = YES;
//        }else{
            NSLog(@"line : %@",substring);
//        }
    }];
    
    
//    [str enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
//        if(line.length < 5) {
//            *stop = YES;
//        }else{
//            NSLog(@"line : %@",line);
//        }
//    }];
    
    
    
    /*
    NSUInteger start,end,contentsEnd;
    
    int i = 0, j = 17;
    [str getLineStart:&start end:&end contentsEnd:&contentsEnd forRange:NSMakeRange(i, j)];
    
    NSRange range = [str lineRangeForRange:NSMakeRange(i, j)];
    NSLog(@"%d , %d",i,j);
    NSLog(@"start :  %ld, end: %ld, contents: %ld ",start,end,contentsEnd);
    
    NSString *str1 = [str substringWithRange:NSMakeRange(0, 23)];
    NSLog(@"%@",str1);
    */
}

- (void)searchString{
    NSString *str  = @"hello world";
    NSString *str1 = @"hello,meinv";
    
    BOOL b1 = [str hasPrefix:@"hello"];
    BOOL b2 = [str hasSuffix:@"hello"];
    NSString *str2 = [str commonPrefixWithString:str1 options:NSLiteralSearch];
    BOOL b3 = [str containsString:@"world"];
    BOOL b4 = [str localizedCaseInsensitiveContainsString:@"World"];

    BOOL b5 = [str localizedStandardContainsString:@"World"];
    
    
    NSString * b6 = [str capitalizedString];
}

- (void)testEqualString{
    NSString *str1 = @"ABCD";
    NSString *str2 = nil;
    NSComparisonResult result = [str1 compare:str2];
    NSComparisonResult result1 = [str1 compare:str2 options:NSLiteralSearch range:NSMakeRange(2, 1)];

    BOOL a = [str1 isEqualToString:str2];
    
    NSLog(@"result = %ld   result1 = %ld",result,result1);
}

- (void)testSubString{
    
    //遍历 NSString的字符  使用rangeOfComposedCharacterSequenceAtIndex解决字符切分问题
    //参考：http://www.udpwork.com/item/10009.html
    NSString *str = @"h👌el👌lo worl👍d！";
    NSRange range;
    for (NSInteger i = 0 ; i < str.length ; i= i + range.length) {
        range = [str rangeOfComposedCharacterSequenceAtIndex:i];
        NSString *s1 = [str substringWithRange:range];

        NSLog(@"%ld :  %@", range.length, s1);
    }
    //substring
    NSString *fromStr = [str substringFromIndex:[str rangeOfComposedCharacterSequenceAtIndex:3].location];
    NSLog(@"fromStr: %@",fromStr);
    
    NSString *toStr = [str substringToIndex:[str rangeOfComposedCharacterSequenceAtIndex:3].location];
    NSLog(@"toStr: %@",toStr);
    
    unichar *charArr = malloc(sizeof(unichar) * 100);
    memset(charArr, 0, sizeof(unichar) * 100);
    [str getCharacters:charArr range:[str rangeOfComposedCharacterSequenceAtIndex:3]];
    for (int i = 0; i < 100; i ++) {
        NSLog(@"cccc :   %c",charArr[i]);
    }
    
    
    
    
}

- (unichar *)testInit{
    //用字符数组初始化
    unichar *charArr = malloc(sizeof(charArr)*100);
    for (int i = 0; i < 10; i ++) {
        charArr[i] = i+65;
    }
    NSString *str1 = [[NSString alloc] initWithCharacters:charArr length:10];
    NSLog(@"chaArr address:%p   str address:%p   str:%@ \n",charArr, str1, str1);
    
//    NSString *str = [[NSString alloc] initWithCharactersNoCopy:charArr length:10 freeWhenDone:YES];
//    NSLog(@"chaArr address:%p   str address:%p   str:%@ \n",&charArr, &str, str);
    
    NSLog(@"charArr[0] = %c",charArr[0]);
    
    //用utf8字符数组初始化
    const char *s =  "hello world!";
    NSString * strUTF8 = [[NSString alloc] initWithUTF8String:s];
    NSLog(@"strUTF8: %@",strUTF8);
    
    //使用NSString初始化
    NSString *aString = @"hello world!";
    NSString *strStr = [[NSString alloc] initWithString:aString];
    NSLog(@"strStr: %@",strStr);
    
    //使用格式化字符串初始化
    NSString *fomrtStr = [[NSString alloc] initWithFormat:@"hello %@ --%d",@"world",100];
    NSLog(@"fomrtStr: %@",fomrtStr);
    
    [self initWithFormat:@"hello %@ --%d",@"world",100];

    //使用格式化本地化字符串初始化
    NSString *fomrtStr3 = [[NSString alloc] initWithFormat:@"hello %@ --%d" locale: [NSLocale currentLocale], @"world",100];
    NSLog(@"fomrtStr3: %@",fomrtStr3);
    
    //类方法通过字符串初始化
    NSString *s1 = @"test";
    NSString *str4 = [NSString stringWithString:s1];
    NSLog(@"str4: %@",str4);

    //init 通过URL
    NSError *error = nil;
    NSString *urlStr = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265-SW1"] encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"URLStr : %@",urlStr);
    
    //init 通过URL2
    NSURL *textFileURL =[NSURL URLWithString:@"https://developer.apple.com/library/prerelease/content/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265-SW1"];
    NSStringEncoding encoding = 0;
    NSError *error1 = nil;
    NSString *string = [[NSString alloc] initWithContentsOfURL:textFileURL usedEncoding:&encoding error:&error1];
    NSLog(@"fuck : string : %@    \n encoding: %lu",string,(unsigned long)encoding);

    return charArr;
    
    
}
//如何获取可变参数
- (void)initWithFormat:(NSString *)format, ... {
    va_list myArgs;
    va_start(myArgs, format);
    NSString *fomrtStr2 = [[NSString alloc] initWithFormat:@"hello %@ --%d" arguments:myArgs];
    va_end(myArgs);
    NSLog(@"fomrtStr2: %@",fomrtStr2);
}



@end
