package edu.miu.service;

import edu.miu.domain.Rent;
import org.springframework.data.domain.Page;

public interface RentService {
    public void create(Rent rent);
    public void update(Rent rent);
    public Rent getById(Long id);
    public Page<Rent> getRents(int page, int limit);
}
