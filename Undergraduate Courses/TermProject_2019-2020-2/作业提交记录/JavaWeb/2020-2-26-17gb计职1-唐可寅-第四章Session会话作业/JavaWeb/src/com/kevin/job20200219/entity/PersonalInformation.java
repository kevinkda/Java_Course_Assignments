package com.kevin.job20200219.entity;

import com.kevin.job20200219.entity.util.BirthdayCalculation;

import java.util.Date;

/**
 * @author Kevin KDA on 2020/2/17 14:26
 * @version 1.0
 * @project JavaTermProject
 * @package com.kevin.job20200217.entity
 * @classname PersonalInformation
 * @description TODO 提供关于人密不可分的信息
 * @interface/enum
 */
public class PersonalInformation {
    private String strName;
    private int intSex;
    private int intHeight;
    private Date dateBirth;
    private double douWeight;
    private String strId;

    public PersonalInformation(String strName, String strSex, int intHeight, Date dateBirth, double douWeight, String strId) {
        this.strName = strName;
        setStringSex(strSex);
        this.intHeight = intHeight;
        this.dateBirth = dateBirth;
        this.douWeight = douWeight;
        this.strId = strId;
    }

    public String getStrName() {
        return strName;
    }

    public void setStrName(String strName) {
        this.strName = strName;
    }

    /**
     * @param
     * @return int:返回标准性别数据;0(女)、1(男)
     * @author Kevin KDA on 2020/2/19 14:05
     * @description PersonalInformation /  TODO 返回未经可视化的性别数据，交后续程序进行处理
     */
    public int getIntSex() {
        return intSex;
    }

    /**
     * @param
     * @return String:返回文字化的性别数据
     * @author Kevin KDA on 2020/2/17 14:26
     * @description PersonalInformation /  TODO 对已清洗的性别数据进行可视化，使人能理解
     */
    public String getStringSex() {
        return intSex == 1 ? "男" : "女";
    }

    /**
     * @param strSex: 提供文字化性别数据
     * @return void
     * @author Kevin KDA on 2020/2/17 14:26
     * @description PersonalInformation /  TODO 将文字化性别数据转化为0(女)、1(男)，确保数据统一
     */
    public void setStringSex(String strSex) {
        if ("男".equals(strSex)) {
            this.intSex = 1;
        } else {
            this.intSex = 0;
        }
    }

    public int getIntHeight() {
        return intHeight;
    }

    public void setIntHeight(int intHeight) {
        this.intHeight = intHeight;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public int getIntAgeByBirth() {
        return BirthdayCalculation.getAgeByBirth(dateBirth);
    }

    public double getDouWeight() {
        return douWeight;
    }

    public void setDouWeight(double douWeight) {
        this.douWeight = douWeight;
    }

    public String getStrId() {
        return strId;
    }

    public void setStrId(String strId) {
        this.strId = strId;
    }
}
