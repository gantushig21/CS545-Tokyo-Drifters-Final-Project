package edu.miu.service;

import edu.miu.domain.Customer;

public interface CustomerService {
    public void create(Customer customer);
    public Customer getById(Long id);
}
