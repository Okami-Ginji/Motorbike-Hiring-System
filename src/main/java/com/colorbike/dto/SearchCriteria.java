
package com.colorbike.dto;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//nhu cầu, khoảng giá, hãng, loại, phân khối
@AllArgsConstructor
public class SearchCriteria {

    private List<PriceRange> priceRanges;
    private List<Integer> brandIDs;
    private List<Integer> categoryIDs;
    private List<Integer> demandIDs;
    private List<Integer> displacements;

    public void addPriceRange(int minPrice, int maxPrice) {
        this.priceRanges.add(new PriceRange(minPrice, maxPrice));
    }

    public List<PriceRange> getPriceRanges() {
        return priceRanges;
    }

    // Inner class to represent a price range
    @NoArgsConstructor
    @AllArgsConstructor
    @Getter
    @Setter
    @ToString
    public static class PriceRange {
        private int minPrice;
        private int maxPrice;
    }
}
