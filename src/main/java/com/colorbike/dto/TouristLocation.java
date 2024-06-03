/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.colorbike.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author huypd
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TouristLocation {
    private String locationName;
    private String description;
    private String urlArticle;
    private String staffID;
}
