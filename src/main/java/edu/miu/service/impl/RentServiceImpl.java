package edu.miu.service.impl;

import edu.miu.domain.Rent;
import edu.miu.repository.RentRepository;
import edu.miu.service.RentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class RentServiceImpl implements RentService {
    @Autowired
    private RentRepository rentRepository;

    @Override
    public Page<Rent> getRents(int page, int limit) {
        Pageable pageable = PageRequest.of(page,limit);
        return  rentRepository.findAll(pageable);
    }

    @Override
    public void create(Rent rent) {
        rentRepository.save(rent);
    }

    @Override
    public void update(Rent rent) {
        System.out.println("Update: " + rent);
        rentRepository.save(rent);
    }

    @Override
    public Rent getById(Long id) {
        Optional<Rent> rent = rentRepository.findById(id);
        return rent.get();
    }
}
