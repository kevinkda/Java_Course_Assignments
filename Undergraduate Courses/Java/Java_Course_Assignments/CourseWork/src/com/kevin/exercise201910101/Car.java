/*
 * Copyright (c) 2020 Kevin KDA. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.kevin.exercise201910101;

/**
 * @Project Java_Course_Assignments
 * @Package Exercise_20191010_1
 * @Author Kevin KDA
 * @Description TODO
 * @Date 2019/10/10 8:45
 * @Interface
 * @Enum
 * @Version 1.0
 */
public class Car implements IMount{
    public String name;

    public Car() {
    }

    public Car(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void move() {
        System.out.println("这是" + this.name + "牌汽车，时速能达到120公里！");
    }

    @Override
    public void run() {
        System.out.println("开始变形！！！！");
    }
}
