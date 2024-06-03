
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
public class PriceListHistory {
    private int historyId;
    private double perDay;
    private double perWeek;
    private double perMonth;
    private String startDate;
    private String endDate;
    private int priceListID;
}
