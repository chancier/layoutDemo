layoutDemo
==========

NSLayoutConstraint  针对UIView+AutoLayout写的demo供自己学习参考
下面是另外的小知识点关于@2x、@3x

/*
 *
 如果@2x、@3x都存在
｛
    6及以下自动取@2x图片
    6+取@3x图片
 ｝
 
 以下是取了各个图片后的处理方式：
 
 @2x： @2x全部自动除以2 无论是否带了后缀@2x.png
 @3x： @3x全部自动除以3 无论是否带了后缀@3x.png
 
 
 建议：不带@2x @3x 
 这样  6以下自动取@2x图片
       6+取@3x图片
 
 *
 */
