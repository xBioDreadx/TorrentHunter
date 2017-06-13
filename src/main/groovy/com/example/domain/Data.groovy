package com.example.domain

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

/**
 * Created by levchenko on 12.06.17.
 */
@Entity
class Data {
    @Id
    @GeneratedValue
    Long id


    String paramName

    Integer postNumber

    Date date
    Float value

    Data() {
    }
}