package edu.miu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.miu.domain.CheckOut;
import edu.miu.repository.CheckoutRepository;
import edu.miu.service.CheckOutService;

@Service
@Transactional
public class CheckOutServiceImpl implements CheckOutService {

	 @Autowired
	 private CheckoutRepository checkoutRepository;

	@Override
	public CheckOut saveCheckOut(CheckOut checkOut) {
		return checkoutRepository.save(checkOut);
	}

}
