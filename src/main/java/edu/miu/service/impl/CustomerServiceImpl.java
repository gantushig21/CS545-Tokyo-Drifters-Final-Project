package edu.miu.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.miu.domain.Customer;
import edu.miu.repository.CustomerRepository;
import edu.miu.service.CustomerService;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;

	@Override
	public Customer findCustomerbyPassportId(String passportId) {
		// TODO Auto-generated method stub
		return customerRepository.findCustomerByPassportId(passportId);
	}

	@Override
	public Customer saveCustomer(Customer customer) {
		// TODO Auto-generated method stub

		return customerRepository.save(customer);
	}

	@Override
	public void deleteCustomer(long Id) {
		// TODO Auto-generated method stub
		customerRepository.deleteById(Id);
	}

	@Override
	public Customer updateCustomer(Customer customer) {
		// TODO Auto-generated method stub

		return customerRepository.save(customer);

	}

	@Override
	public List<Customer> findAll() {

		return (List<Customer>) customerRepository.findAll();
	}

	@Override
	public boolean checkCustomer(long id) {

		return customerRepository.existsById(id);
	}

	@Override
	public Customer findCustomer(long id) {

		Optional<Customer> res = customerRepository.findById(id);

		if (res.isPresent()) {
			return res.get();
		}
		return null;
	}

}
