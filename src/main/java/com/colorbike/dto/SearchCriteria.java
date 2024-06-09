package com.colorbike.dto;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//nhu cầu, khoảng giá, hãng, loại, phân khối
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class SearchCriteria {

    private List<PriceRange> priceRanges;
    private List<Integer> brandIDs;
    private List<Integer> categoryIDs;
    private List<Integer> demandIDs;
    private List<String> displacements;

    public void addPriceRange(int minPrice, int maxPrice) {
        this.priceRanges.add(new PriceRange(minPrice, maxPrice));
    }


    // Inner class to represent a price range
    @NoArgsConstructor
    @AllArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class PriceRange {

        private double minPrice;
        private double maxPrice;
    }
}
