/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author huypd
 */
//nhu cầu, khoảng giá, hãng, loại, ohaan khối
public class SearchCriteria {
    private List<PriceRange> priceRanges;
    private List<Integer> brandIDs;
    private List<Integer> categoryIDs;
    private List<Integer> demandIDs;
    private List<Integer> displacements;
    public SearchCriteria() {
        this.priceRanges = new ArrayList<>();
        this.brandIDs = new ArrayList<>();
        this.categoryIDs = new ArrayList<>();
        this.demandIDs = new ArrayList<>();
        this.displacements = new ArrayList<>();
    }

    public void addPriceRange(int minPrice, int maxPrice) {
        this.priceRanges.add(new PriceRange(minPrice, maxPrice));
    }

    // Getters and setters for other criteria

    public List<PriceRange> getPriceRanges() {
        return priceRanges;
    }

    // Inner class to represent a price range
    public static class PriceRange {
        private int minPrice;
        private int maxPrice;

        public PriceRange(int minPrice, int maxPrice) {
            this.minPrice = minPrice;
            this.maxPrice = maxPrice;
        }

        public int getMinPrice() {
            return minPrice;
        }

        public int getMaxPrice() {
            return maxPrice;
        }
    }
}
