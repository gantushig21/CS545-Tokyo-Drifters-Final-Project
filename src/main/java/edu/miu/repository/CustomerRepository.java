package edu.miu.repository;

import edu.miu.domain.Car;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import edu.miu.domain.Customer;

public interface CustomerRepository extends PagingAndSortingRepository<Customer, Long> {
	@Override
	Page<Customer> findAll(Pageable pageable);
	
	@Query("SELECT c from Customer c WHERE c.passportId = :passportId")
	public Customer findCustomerByPassportId(@Param("passportId") String passportId);

}
