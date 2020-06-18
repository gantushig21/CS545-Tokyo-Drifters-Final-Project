package edu.miu.service.impl;

import edu.miu.domain.Checkout;
import edu.miu.repository.CheckoutRepository;
import edu.miu.service.CheckoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional
public class CheckoutServiceImpl implements CheckoutService {
    @Autowired
    private CheckoutRepository checkoutRepository;

    @Override
    public Page<Checkout> getCheckouts(int page, int limit) {
        Pageable pageable = PageRequest.of(page,limit);
        return  checkoutRepository.findAll(pageable);
    }

    @Override
    public void create(Checkout checkout) {
        checkoutRepository.save(checkout);
    }

    @Override
    public void update(Checkout checkout) {
        System.out.println("Update: " + checkout);
        checkoutRepository.save(checkout);
    }

    @Override
    public Checkout getById(Long id) {
        Optional<Checkout> checkout = checkoutRepository.findById(id);
        return checkout.get();
    }
}
