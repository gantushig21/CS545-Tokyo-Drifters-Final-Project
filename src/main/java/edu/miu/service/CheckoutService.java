package edu.miu.service;

import edu.miu.domain.Checkout;
import org.springframework.data.domain.Page;

public interface CheckoutService {
    public void create(Checkout checkout);
    public void update(Checkout checkout);
    public Checkout getById(Long id);
    public Page<Checkout> getCheckouts(int page, int limit);
}
