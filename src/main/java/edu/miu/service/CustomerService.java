package edu.miu.service;

import java.util.List;

import edu.miu.domain.Car;
import edu.miu.domain.Customer;
import org.springframework.data.domain.Page;

public interface CustomerService {
	public Customer findCustomerbyPassportId(String passportId);
	public Customer saveCustomer(Customer customer);
	public void deleteCustomer(long Id);
	public Customer updateCustomer(Customer customer);
	List<Customer> findAll();
	boolean checkCustomer(long id);
	Customer findCustomer(long id);
	
	 public Page<Customer> findAll(int page, int limit);

}
