
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
public class Motorcycle implements Serializable{
    private String motorcycleId;
    private String model;
    private String image;
    private String displacementl;
    private String description;
    private int minAge;
    private int brandID;
    private int categoryID;
    private int priceListID;
    
//    private int dailypriceforday;
//    private int dailypriceforweek;
//    private int dailypriceformonth;
}
