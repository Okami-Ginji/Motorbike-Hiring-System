
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
public class Customer implements Serializable{
    private int customerId;
    private String citizenId;
    private String citizenIdImage;
    private int typeId;
    private int accountId;
}

