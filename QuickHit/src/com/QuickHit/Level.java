package com.QuickHit;


//游戏等级
public class Level {
    //等级系统包括 1，级别 2，各个级别输出的字符串长度 3，各级别输出字符串的次数 4，各级别闯关的时间限制
    //各级别正确输入一次的得分

    private int levelNo;//级别
    private int strLength; //输出字符串的长度
    private int strTimes;//各级别输出字符串的次数
    private int timeLimit;//时间限制
    private int perScore;//正确输入一次的得分
    public final static int a = 100;    //晋级一次要的分数

    public Level(){}
    public Level(int levelNo, int strLength, int strTimes, int timeLimit, int perScore){
        this.levelNo = levelNo;
        this.strLength = strLength;
        this.strTimes = strTimes;
        this.timeLimit = timeLimit;
        this.perScore = perScore;
    }

    public int getLevelNo() {
        return levelNo;
    }

    public void setLevelNo(int levelNo) {
        this.levelNo = levelNo;
    }

    public int getStrLength() {
        return strLength;
    }

    public void setStrLength(int strLength) {
        this.strLength = strLength;
    }

    public int getStrTimes() {
        return strTimes;
    }

    public void setStrTimes(int strTimes) {
        this.strTimes = strTimes;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public int getPerScore() {
        return perScore;
    }

    public void setPerScore(int perScore) {
        this.perScore = perScore;
    }
}
