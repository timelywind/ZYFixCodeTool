
// MARK: -----------------------  mixCodes
// 删除正则匹配的标签
+ (NSString *)removeTagsTHERForContent:(NSString *)content regexTHERString:(NSString *)regexString
{
    NSRegularExpression *gifRegular = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive  error:nil];
    NSArray *gifMatches = [gifRegular matchesInString:content options:0 range:NSMakeRange(0, content.length)];
    NSMutableArray *gifM = [NSMutableArray array];
    for (NSTextCheckingResult *match in gifMatches) {
        [gifM addObject:[content substringWithRange:[match range]]];
    }
    for (NSString *gifStr in gifM) {
        content = [content stringByReplacingOccurrencesOfString:gifStr withString:@""];
    }
    return content;
}


// 获取img标签中属性数据
+ (NSDictionary *)dictionTHERaryWithElementStr:(NSString *)string
{
    NSArray *arr = [string componentsSeparatedByString:@" "];
    
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    for (NSString *str in arr) {
        if (str.length == 0) {
            continue;
        }
        
        if ([str containsString:@"data-width"] || [str containsString:@"data-height"]) {
            NSArray *tmpArr = [str componentsSeparatedByString:@"="];
            if (tmpArr.firstObject && tmpArr.lastObject) {
                [dictM setObject:[tmpArr.lastObject stringByReplacingOccurrencesOfString:@"\"" withString:@""] forKey:tmpArr.firstObject];
            }
        }
    }
    return dictM;
}


+ (void)code_functionNameTHER_THER
{
    NSString *str = @"code_functionNamehele_THER";
    NSString *oldFileName = @"CodeStringTHER";
    NSString *fileName = @"CodeString_THER";
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"."] withString:[fileName stringByAppendingString:@"."]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@" "] withString:[fileName stringByAppendingString:@" "]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"("] withString:[fileName stringByAppendingString:@"("]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"\n"] withString:[fileName stringByAppendingString:@"\n"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"\""] withString:[fileName stringByAppendingString:@"\""]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"*"] withString:[fileName stringByAppendingString:@"*"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@";"] withString:[fileName stringByAppendingString:@";"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@">"] withString:[fileName stringByAppendingString:@">"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"<"] withString:[fileName stringByAppendingString:@"<"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"THER"] withString:[fileName stringByAppendingString:@","]];
}


+ (void)codefunctionNameTHERsetTitleColor
{
    [UIView animateWithDuration:1 animations:^{
        
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [button addTarget: self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:1 animations:^{
        
    }];
}


+ (void)code_functionName_THERbutton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [button addTarget: self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

+ (BOOL)including_Number_THER:(int)codeNumber
{
    if (codeNumber >= 48 && codeNumber<= 57) {
        return YES;
    }
    if (codeNumber >= 65 && codeNumber<= 90) {
        return YES;
    }
    if (codeNumber >= 97 && codeNumber<= 122) {
        return YES;
    }
    if (codeNumber == 95) {
        return YES;
    }
    if (codeNumber == 43) {
        return YES;
    }
    
    return NO;
}

+ (void)codefunctionNameTHERanimateWithTHERDuration
{
    [UIView animateWithDuration:1 animations:^{
        
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [button addTarget: self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:1 animations:^{
        
    }];
}

// 处理content的内容  给每个<img/>标签 按照屏幕等比例添加宽高
+ (NSString *)configConTHERtentTagsWithContent:(NSString *)content
{
    // 1.删除关键词
    
    // 3.对img标签设置宽高
    NSString *regexImgString = @"<img.*?src=.*?>";
    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regexImgString options:NSRegularExpressionCaseInsensitive  error:nil];
    // 对str字符串进行匹配
    NSArray *matches = [regular matchesInString:content options:0 range:NSMakeRange(0, content.length)];
    // 遍历匹配后的每一条记录
    NSMutableArray *imgTagsM = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        [imgTagsM addObject:[content substringWithRange:[match range]]];
    }
    return content;
}

// 2015-07-06 10:35  和本地时间对比,转换成为 几分钟前/几小时前/几秒前
+ (NSString *)lscoverDateTHERBeforeNowWithString:(NSString *)dateStr {
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *date = [df dateFromString:dateStr];
    long s = -1 * [date timeIntervalSinceNow];
    
    
    long weak = s/(3600*24*7);
    if (weak != 0) {
        return [NSString stringWithFormat:@"%ld周前",weak];
    }
    
    long hour = s/(3600);
    if (hour != 0) {
        return [NSString stringWithFormat:@"%ld小时前",hour];
    }
    long minute = s/(60);
    if (minute != 0) {
        if (minute <=20) {
            return @"最新";
        }
        return [NSString stringWithFormat:@"%ld分钟前",minute];
    }
    return @"最新";
}

+ (void)code_functionNameTHERWithTHERString
{
    NSString *str = @"code_functionNamehele_THER";
    NSString *oldFileName = @"CodeStringTHER";
    NSString *fileName = @"CodeString_THER";
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"."] withString:[fileName stringByAppendingString:@"."]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@" "] withString:[fileName stringByAppendingString:@" "]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"("] withString:[fileName stringByAppendingString:@"("]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"{"] withString:[fileName stringByAppendingString:@"THER"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@":"] withString:[fileName stringByAppendingString:@":"]];
    str = [str stringByReplacingOccurrencesOfString:[oldFileName stringByAppendingString:@"\n"] withString:[fileName stringByAppendingString:@"\n"]];
    
    NSMutableString *mutString = str.mutableCopy;
    
    [mutString appendString:@"THER"];
    [mutString appendString:@"THERTHER"];
    [mutString appendString:@"THER_aa"];
    [mutString appendString:@"THERerre"];
}

+ (UIViewController *)windowForCode_THERwindow
{
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[UIViewController alloc]init];
    window.rootViewController.view.backgroundColor = [UIColor redColor];
    return window.rootViewController;
}

+ (void)code_changeHehe_logg_THER
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(code_functionNameTHERglobal_queue)];
    [titleLabel addGestureRecognizer:tapGesture];
    
}

+ (void)code_functionNameTHERglobal_queue
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
}

+ (void)code_functionNameTHERtitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentLeft;
}

+ (void)code_functionNameTHERdispatchA
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
}

+ (NSMutableArray *)getTHERRangeStr:(NSString *)text findText:(NSString *)findText
{
    NSMutableArray *arrayRanges = [NSMutableArray arrayWithCapacity:3];
    if (findText == nil && [findText isEqualToString:@""]) {
        return nil;
    }
    NSRange rang = [text rangeOfString:findText]; //获取第一次出现的range
    if (rang.location != NSNotFound && rang.length != 0) {
        
        int prefixAsciiCode = [text characterAtIndex:rang.location - 1]; // 前
        int suffixAsciiCode = [text characterAtIndex:rang.location + findText.length]; // 后
        
        prefixAsciiCode = suffixAsciiCode;
        NSRange rang1 = {0, 0};
        NSInteger location = 0;
        NSInteger length = 0;
        for (int i = 0;; i++) {
            if (0 == i) {//去掉这个xxx
                location = rang.location + rang.length;
                length = text.length - rang.location - rang.length;
                rang1 = NSMakeRange(location, length);
            } else {
                location = rang1.location + rang1.length;
                length = text.length - rang1.location - rang1.length;
                rang1 = NSMakeRange(location-1, length);
            }
            
            //在一个range范围内查找另一个字符串的range
            rang1 = [text rangeOfString:findText options:NSLiteralSearch range:rang1];
            if (rang1.location == NSNotFound && rang1.length == 0) {
                break;
            } else {//添加符合条件的location进数组
                int prefixAsciiCode = [text characterAtIndex:rang1.location - 1]; // 前
                int suffixAsciiCode = [text characterAtIndex:rang1.location + findText.length]; // 后
                
                prefixAsciiCode = suffixAsciiCode;
            }
        }
        return arrayRanges;
    }
    return nil;
}


+ (void)cotipLabelde_tipLabelonNameTHERTips
{
    // 提示Label
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont systemFontOfSize:15.0];
    tipLabel.textAlignment = NSTextAlignmentCenter;
}

+ (void)code_functionNameTHERUIlabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    for (int i = 0; i < view.subviews.count; i++) {
        UIView *subview = view.subviews[i];
        //        NSLog(@"%@", subview);
        [subview class];
    }
    
}


+ (UIImage *)lss_THERWitfadhImageOne:(UIImage *)imageOne imageTwo:(UIImage *)imageTwo clipHeight:(CGFloat)clipHeight bgColor:(UIColor *)bgColor weatherImageName:(NSString *)weatherImageName
{
    CGFloat kScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat kScreenHeight = [UIScreen mainScreen].bounds.size.height;
    //    CGFloat SHScreenWScale = (kScreenWidth/375.0);
    // 二维码的size
    NSString *imageName = [NSString stringWithFormat:@"shareBanner_%d", 1];
    UIImage *shareBannerImage = [UIImage imageNamed:imageName];
    CGSize imageSize = shareBannerImage.size;
    if (kScreenWidth < 375) {
        imageSize = CGSizeMake(kScreenWidth, kScreenWidth / shareBannerImage.size.width * shareBannerImage.size.height);
    }
    
    // 拼接的图片总的size
    CGSize size;
    size.width = imageOne.size.width;
    size.height = imageOne.size.height + clipHeight - 20 + imageSize.height;
    // Draw image
    UIGraphicsBeginImageContextWithOptions(size, YES, 0.0);
    UIImage *bgImg = [UIImage new];
    [bgImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
    if (weatherImageName) {
        UIImage *img = [UIImage imageNamed:weatherImageName];
        [img drawInRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        UIImage *animationImg = [UIImage imageNamed:[NSString stringWithFormat:@"share_%@", weatherImageName]];
        [animationImg drawInRect:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH"];
        NSString *nowStr = [formatter stringFromDate:[NSDate date]];
        UIImage *coverImg = [UIImage imageNamed:@"dayShadow"];
        if (nowStr.integerValue <= 6 || nowStr.integerValue >= 18) {
            coverImg = [UIImage imageNamed:@"nightShadow"];
        }
        [coverImg drawInRect:CGRectMake(0, (kScreenHeight - 342) / 2.0, kScreenWidth, 342)];
    }
    [imageOne drawInRect:CGRectMake(0, -20, imageOne.size.width, imageOne.size.height)];
    [imageTwo drawInRect:CGRectMake(0, imageOne.size.height-20, imageOne.size.width, imageTwo.size.height)];
    UIImage *bgColorImage = [UIImage new];
    CGRect shareBannerImageRect = CGRectMake(0, size.height - imageSize.height, imageOne.size.width, imageSize.height);
    [bgColorImage drawInRect: shareBannerImageRect];
    [shareBannerImage drawInRect: shareBannerImageRect];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //    [self writeToFileWithImage:resultImage];
    
    return resultImage;
}



+ (void)code_changeHeheTHERLogh
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(code_functionNameTHERglobal_queue)];
    [titleLabel addGestureRecognizer:tapGesture];
    
}

+ (UIImage *)screenTHERshot:(UIView *)shotView {
    
    UIGraphicsBeginImageContextWithOptions(shotView.frame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [shotView.layer renderInContext:context];
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return getImage;
}

+ (UIImage *)screenshotTHER:(UIView *)shotView {
    
    UIGraphicsBeginImageContextWithOptions(shotView.frame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [shotView.layer renderInContext:context];
    UIImage *getTHERImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return getTHERImage;
}

@end
