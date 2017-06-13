package com.example.repositories

import com.example.domain.Data
import com.example.domain.Param
import com.example.domain.Post
import org.springframework.data.jpa.repository.JpaRepository

/**
 * Created by levchenko on 12.06.17.
 */

interface DataRepository extends JpaRepository<Data, Long> {

    List<Data> findAllByPostNumber(Integer postNumber)
    List<Data> findAllByParamName(String paramName)
//    List<Data> findAllByPostAndParam(Post post,Param param)

}
