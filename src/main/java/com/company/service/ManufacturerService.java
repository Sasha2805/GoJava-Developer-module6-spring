package com.company.service;

import com.company.model.Manufacturer;
import java.util.UUID;

public interface ManufacturerService extends ModelService<Manufacturer, UUID>{
    Manufacturer findByName(String name);
}
