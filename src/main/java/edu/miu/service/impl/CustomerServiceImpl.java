package edu.miu.service.impl;

import edu.miu.domain.Customer;
import edu.miu.repository.CustomerRepository;
import edu.miu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void create(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public Customer getById(Long id) {
        Optional<Customer> customer = customerRepository.findById(id);

        return customer.get();
    }
}
