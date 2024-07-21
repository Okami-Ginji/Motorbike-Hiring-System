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
public class Feedback implements Serializable {

    private int feedbackID;
    private String content;
    private int productRate;
    private int serviceRate;
    private int deliveryRate;
    private String feedbackTime;
    private String customerName;
    private String customerImage;
    private int CustomerId;
    private String BookingID;

    public Feedback(int fbId, String content, int productRate, int serviceRate, int deliveryRate, int customerId, String bookingId) {
        this.feedbackID = fbId;
        this.content = content;
        this.productRate = productRate;
        this.serviceRate = serviceRate;
        this.deliveryRate = deliveryRate;
        this.CustomerId = customerId;
        this.BookingID = bookingId;
    }

    public Feedback(int feedbackID, String content, int productRate, int serviceRate, int deliveryRate, String feedbackTime, int CustomerId, String BookingID) {
        this.feedbackID = feedbackID;
        this.content = content;
        this.productRate = productRate;
        this.serviceRate = serviceRate;
        this.deliveryRate = deliveryRate;
        this.feedbackTime = feedbackTime;
        this.CustomerId = CustomerId;
        this.BookingID = BookingID;
    }

    

    
}
