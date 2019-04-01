package com.QuickHit;

import java.util.Random;

//游戏类
public class Game {
    //将玩家作为属性放入，方便使用玩家的信息
    Player player;
    public Game(){}
    public Game(Player player){
        this.player = player;
    }


    //游戏需要的行为：打印字符串，判断玩家输入的是否正确，输出相应的结果信息
    public String printStr(){       //输出字符串并且返回该字符串 用于接下来的比较
        StringBuffer buffer = new StringBuffer();//构造一个没有字符的字符串缓冲区，初始容量为16个字符
        Random random = new Random();
        int strlen = 0;                 //声明一个长度
        for (Level level: LevelParam.levels){
            if (player.getLevelNo() == level.getLevelNo()){     //判断玩家的等级 输出对应等级的字符串长度
                strlen = level.getStrLength();
            }
        }
        //通过循环生成要输出的字符串
        for (int i = 0; i < strlen; i++){
            //产生随机数
            int rand = random.nextInt(strlen);  //参数strlen放入后 产生0~strlen的随机数
            //根据随机数拼接字符串
            switch (rand){
                case 0:
                    buffer.append("a");
                    break;
                case 1:
                    buffer.append("b");
                    break;
                case 2:
                    buffer.append("c");
                    break;
                case 3:
                    buffer.append("d");
                    break;
                case 4:
                    buffer.append("e");
                    break;
                case 5:
                    buffer.append("f");
                    break;

            }
        }
        System.out.println(buffer); //输出拼接完后的字符串
        return buffer.toString();   //将buffer转换成String类型返回
    }

    public void printResult(String out, String in){
        //输出比较的相应信息 并且输出玩家的级别 积分 已用时间
        //接收当前时间的值
        long currentTime = System.currentTimeMillis();//以毫秒为单位
        if (out.equals(in)){        //如果用户输入和系统输出一样
            if ((int)(currentTime - player.getStartTime())/1000 > LevelParam.levels[player.getLevelNo()-1].getTimeLimit()){
                System.out.println("你输入的太慢了，已经超时了，退出");
                System.exit(1);
            }else{
                player.setCurScore(player.getCurScore() +
                        LevelParam.levels[player.getLevelNo()-1].getStrTimes());    //玩家当前的积分加上输入对一次获得的分数
                System.out.println("输入正确,您的级别"+player.getLevelNo()+"您的积分"+player.getCurScore()+"已用时间"+
                        (int)((currentTime - player.getStartTime())/1000)+"秒");
                currentTime = 0;
            }
        }else{
            System.out.println("你输入错误，结束游戏");
            System.exit(1);
        }
    }
}
