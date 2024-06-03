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
public class Cancellation implements Serializable{

    private int cancellationID;
    private String cancellationDate;
    private String note;
    private String bookingID;
    private String staffID;
}
