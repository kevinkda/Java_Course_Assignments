package com.chinasoft.ssm.domain;

import lombok.Data;

@Data
public class User {
    private int userId;
    private String userName;
    private int userScore;
    public User(){}
}
