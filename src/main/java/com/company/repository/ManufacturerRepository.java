package com.company.repository;

import com.company.model.Manufacturer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.UUID;

@Repository
public interface ManufacturerRepository extends JpaRepository<Manufacturer, UUID> {
    @Query("FROM Manufacturer WHERE name = :name")
    Manufacturer findByName(@Param("name") String name);
}
