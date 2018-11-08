// 2015-07-06 10:35  和本地时间对比,转换成为 几分钟前/几小时前/几秒前
+ (NSString *)lslsddds_tthh_coverDateBeforeNowWithString:(NSString *)dateStr {
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *date = [df dateFromString:dateStr];
    long s = -1 * [date timeIntervalSinceNow];
    
    long month = s/(3600*24*7*4);
    if (month != 0) {
        return [NSString stringWithFormat:@"%ld月前",month];
    }
    long weak = s/(3600*24*7);
    if (weak != 0) {
        return [NSString stringWithFormat:@"%ld周前",weak];
    }
    long day = s/(3600*24);
    if (day != 0) {
        return [NSString stringWithFormat:@"%ld天前",day];
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


+ (void)lsls_set_tthhwerqee:(UIImageView *)bgView
{
    UIImageView *view = [[UIImageView alloc] init];
    [view class];
}

- (BOOL)lss_inclu_tthhdingNumber:(int)codeNumber
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

+ (UIImage *)lss__tthhspliceWitfadhImageOne:(UIImage *)imageOne imageTwo:(UIImage *)imageTwo clipHeight:(CGFloat)clipHeight bgColor:(UIColor *)bgColor weatherImageName:(NSString *)weatherImageName
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

@end
