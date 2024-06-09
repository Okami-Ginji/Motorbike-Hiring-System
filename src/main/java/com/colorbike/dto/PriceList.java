
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
<<<<<<< HEAD
=======

>>>>>>> 44b5f94da651db2b9709adaebb50460e8c04453a
public class PriceList implements Serializable{
    private int priceListId;
    private double dailyPriceForDay;
    private double dailyPriceForWeek;
    private double dailyPriceForMonth;
}
