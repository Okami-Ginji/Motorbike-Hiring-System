
package com.colorbike.dto;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Booking implements Serializable{

    private String bookingID, bookingDate, startDate, endDate, deliveryLocation, returnedLocation;
    private int voucherID;
    private int customerID;
    
}
