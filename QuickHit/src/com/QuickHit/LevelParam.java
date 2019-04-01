package com.QuickHit;

//级别类的具体信息
public class LevelParam {
    //游戏等级分为6级 所以创建6个数组，存放各个级别的不同参数
    //使用public final static 修饰该数组 使得只可以访问 但不可以修改
    public final static Level levels[] = new Level[6];

    //初始化数组
    static {
        levels[0] = new Level(1,2,5,20,20);
        levels[1] = new Level(2,3,5,25,20);
        levels[2] = new Level(3,4,5,25,20);
        levels[3] = new Level(4,5,5,28,20);
        levels[4] = new Level(5,6,5,30,20);
        levels[5] = new Level(6,7,5,35,20);
    }
}
