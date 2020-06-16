package edu.miu.repository;

import edu.miu.domain.Rent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RentRepository extends PagingAndSortingRepository<Rent, Long> {
    @Override
    Page<Rent> findAll(Pageable pageable);
}
