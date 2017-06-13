package com.example.repositories

import com.example.domain.Param
import com.example.domain.Post
import org.springframework.data.jpa.repository.JpaRepository

/**
 * Created by levchenko on 12.06.17.
 */

interface PostRepository extends JpaRepository<Post, Long> {

    Post findFirstByName(String name)
}
