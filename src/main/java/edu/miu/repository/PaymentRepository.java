package edu.miu.repository;

import org.springframework.data.repository.CrudRepository;

import edu.miu.domain.Payment;

public interface PaymentRepository extends CrudRepository<Payment, Long> {

}
