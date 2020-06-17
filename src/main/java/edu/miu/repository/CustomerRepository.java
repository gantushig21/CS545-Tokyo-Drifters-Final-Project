package edu.miu.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import edu.miu.domain.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Long> {
	
	@Query("SELECT c from Customer c WHERE c.passportId = :passportId")
	public Customer findCustomerByPassportId(@Param("passportId") String passportId);

}
