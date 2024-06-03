
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
    private double pricePerDay;
    private double pricePerWeek;
    private double pricePerMonth;
}
