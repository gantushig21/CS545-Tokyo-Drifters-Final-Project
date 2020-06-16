package edu.miu.service.impl;

import edu.miu.domain.Rent;
import edu.miu.repository.RentRepository;
import edu.miu.service.RentService;
import org.springframework.beans.factory.annotation.Autowired;

public class RentServiceImpl implements RentService {
    @Autowired
    private RentRepository rentRepository;

    @Override
    public void create(Rent rent) {
        rentRepository.save(rent);
    }

    @Override
    public void update(Rent rent) {
        rentRepository.save(rent);
    }
}