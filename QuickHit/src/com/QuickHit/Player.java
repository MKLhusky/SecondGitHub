package com.QuickHit;

import java.util.Scanner;
//玩家
public class Player {
    //玩家的属性有，1，级别 2，当前的积分 3，玩家已用的时间
    private int levelNo; //玩家当前级别
    private int curScore;//玩家当前积分
    private long startTime = 0;//玩家开始的时间
    private int elapsedTime;//玩家当前的时间      当前时间减去开始时间就等于已用时间



    public int getLevelNo() {
        return levelNo;
    }

    public void setLevelNo(int levelNo) {
        this.levelNo = levelNo;
    }

    public int getCurScore() {
        return curScore;
    }

    public void setCurScore(int curScore) {
        this.curScore = curScore;
    }

    public long getStartTime() {
        return startTime;
    }

    public void setStartTime(long startTime) {
        this.startTime = startTime;
    }

    public int getElapsedTime() {
        return elapsedTime;
    }

    public void setElapsedTime(int elapsedTime) {
        this.elapsedTime = elapsedTime;
    }

    //玩家玩游戏需要一个play玩法
    public void play(){
        //判断玩家是否可以晋级，如果可以晋级那么每次玩家晋级后积分清零 计时清零
        Scanner input = new Scanner(System.in);
        Game game = new Game(this);     //将player传入
        int sum = 0;            //计数
        for(int i = 0; i < LevelParam.levels.length; i++){  //外层循环次数是与等级上限相同 6
            this.startTime = System.currentTimeMillis();
            this.levelNo += 1;
            for(int j = 0; j < LevelParam.levels[this.levelNo-1].getStrTimes();j++){   //内层循环是每个等级的挑战次数
                String a = game.printStr();             //用a接收系统随机配出的字符串
                game.printResult(a,input.next());       //传入自己输入和系统生成的字符串 进行比较

            }
            sum += 1;
            this.curScore = 0;
            if(i == 5){
                System.out.println("通关成功！恭喜你！6666");
                System.exit(0);
            }
            System.out.println("恭喜，晋级了");
        }
    }
}
