
package com.colorbike.dto;

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
public class PriceList {
    private int priceListId;
    private double price1to5;
    private double price6to10;
    private double price11to15;
    private double price16to20;
    private double price21to25;
    private double price26to30;
    private double price30up;
}
