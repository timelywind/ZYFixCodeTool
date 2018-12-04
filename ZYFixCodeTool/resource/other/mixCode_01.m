
+ (void)code_sou_functionName_CodeString
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


+ (void)code_functionName_CodeString
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    //    [button addTarget: self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

+ (void)code_functionName_CodeString01
{
    UIView *view = [[UIView alloc] init];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(code_functionName_souluo_CodeString)];
    [view addGestureRecognizer:tapGesture];
}

+ (BOOL)including_Number_CodeString:(int)codeNumber
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

+ (UIViewController *)windowForCode_CodeString
{
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[UIViewController alloc]init];
    window.rootViewController.view.backgroundColor = [UIColor redColor];
    return window.rootViewController;
}

+ (void)code_changeHehe_logg_CodeString
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(code_functionName_souluo_CodeString)];
    [titleLabel addGestureRecognizer:tapGesture];
    
}

+ (void)code_functionName_souluo_CodeString
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    
    
#ifdef DEBUG
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{
            
        }];
    });
    
#endif
}

+ (void)code_functionName_03_souluo_CodeString
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    
    titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentLeft;
}

+ (void)code_functionName_04_souluo
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
}

#pragma mark - ***
+ (NSMutableArray *)getRangeStr:(NSString *)text findText:(NSString *)findText
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


+ (void)cotipLabelde_futipLabelnctitipLabelonName_05_souluo_CodeString
{
    // 提示Label
    UILabel *tipLabel = [[UILabel alloc] init];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.numberOfLines = 0;
    tipLabel.font = [UIFont systemFontOfSize:15.0];
    tipLabel.textAlignment = NSTextAlignmentCenter;
}

+ (void)code_functionName_06_souluo_CodeString
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    for (int i = 0; i < view.subviews.count; i++) {
        UIView *subview = view.subviews[i];
        NSLog(@"%@", subview);
    }
    
}



@end
