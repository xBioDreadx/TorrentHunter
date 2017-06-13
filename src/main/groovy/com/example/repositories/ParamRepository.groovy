package com.example.repositories

import com.example.domain.Param
import org.springframework.data.jpa.repository.JpaRepository

/**
 * Created by levchenko on 12.06.17.
 */

interface ParamRepository extends JpaRepository<Param, Long> {

    Param findFirstByName(String name)
}
