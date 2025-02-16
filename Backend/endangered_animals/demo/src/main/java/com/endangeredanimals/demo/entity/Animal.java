package com.endangeredanimals.demo.entity;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name="animals")
public class Animal {
    
    @Id
    private Integer id;
    @Column(name = "common_name")
    private String commonName;
    @Column(name = "scientific_name")
    private String scientificName;
    @Column(name = "red_list_category")
    private String redListCategory;
    @Column(name = "possibly_extinct_in_the_wild")
    private boolean possiblyExtinctInTheWild;

    @ManyToMany(mappedBy = "favoriteAnimals")
    private Set<User> users;

    @ManyToMany
    @JoinTable(
        name = "animal_threats",
        joinColumns = @JoinColumn(name = "animal_id"),
        inverseJoinColumns = @JoinColumn(name = "threat_id")
    )
    private Set<Threat> threats = new HashSet<>();

    @ManyToMany
    @JoinTable(
        name = "animal_countries",
        joinColumns = @JoinColumn(name = "animal_id"),
        inverseJoinColumns = @JoinColumn(name = "country_id")
    )
    private Set<Country> countries = new HashSet<>();
    
}
