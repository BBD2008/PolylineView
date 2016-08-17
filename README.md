# PolylineView
可以用于大量数据处理的“折线图”，内存和CPU占用都很好。

##动画演示
实际使用非常流畅，gif图受帧率限制无法流畅演示。

![image](https://github.com/BBD2008/PolylineView/raw/master/Image/naodianbo.gif)

##导入方式

把WaveView文件夹拖到项目中即可使用。

##使用方式

WaveView是一个折线图的视图，可同时创建多个使用。  

当前版本提供的接口较简陋。对每秒钟更新数值数量和横向量程只能改源码设置，有修改需求的可以给我留言。

```Objective-C

//核心方法
- (void)refreshWaveWithValue:(float)value;

```

具体使用方式见“折线demo”。

##联系方式

电话：17190086025