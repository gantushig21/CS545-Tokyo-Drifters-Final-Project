package edu.miu.repository;

import edu.miu.domain.Checkout;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CheckoutRepository extends PagingAndSortingRepository<Checkout, Long> {
    @Override
    Page<Checkout> findAll(Pageable pageable);
}
