/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dto;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DiepTCNN
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Contact implements Serializable{

    private int contactID;
    private String name;
    private String phoneNumber;
    private String email;
    private String title;
    private String message;
    private int accountID;
    
    
    
}