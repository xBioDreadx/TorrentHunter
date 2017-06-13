package com.example.domain


import javax.annotation.Generated
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id

/**
 * Created by levchenko on 12.06.17.
 */
@Entity
class Param {
    @Id
    @GeneratedValue
    Long id

    String name
    Float maxValue
    Float averValue

    Float kritKoef

    Param() {
    }
}
