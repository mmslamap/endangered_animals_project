package com.endangeredanimals.demo.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotNull
    @Size(min = 3, max = 30)
    private String username;
    private String password_hash;
    @Enumerated(EnumType.STRING)
    private Role role;
    private Timestamp created_at;
    private Timestamp updated_at;

    @ManyToMany
    @JoinTable(
        name = "user_animal",
        joinColumns = @JoinColumn(name = "user_id"),
        inverseJoinColumns = @JoinColumn(name = "animal_id")
    )
    private Set<Animal> favoriteAnimals = new HashSet<>();

    @PrePersist
    public void onCreate() {

        long now = System.currentTimeMillis();
        this.created_at = new Timestamp(now);
        this.updated_at = this.created_at;
    }

    @PreUpdate
    public void onUpdate() {

        long now = System.currentTimeMillis();
        this.updated_at = new Timestamp(now);
    }
}