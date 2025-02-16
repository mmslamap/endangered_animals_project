package com.endangeredanimals.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.endangeredanimals.demo.entity.Animal;

@Repository
public interface AnimalRepository extends JpaRepository<Animal, Integer>{

    Optional<Animal> findByCommonName(String commonName);

    Optional<Animal> findByScientificName(String scientificName);

    List<Animal> findByRedListCategory(String redListCategory);

    List<Animal> findByPossiblyExtinctInTheWild(Boolean extinctInWild);
}
