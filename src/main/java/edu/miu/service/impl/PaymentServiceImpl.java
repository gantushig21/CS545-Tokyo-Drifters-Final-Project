package edu.miu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.miu.domain.Payment;
import edu.miu.repository.PaymentRepository;
import edu.miu.service.PaymentService;

@Service
@Transactional
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentRepository paymentRepository;

	@Override
	public List<Payment> getAllPayment() {
		return (List<Payment>) paymentRepository.findAll();
	}

}
