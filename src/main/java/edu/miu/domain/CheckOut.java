package edu.miu.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class CheckOut {

	@Id
	@GeneratedValue
	private Long id;
	@OneToOne(cascade=CascadeType.ALL)
	private Payment paymentType;
	@OneToOne(cascade=CascadeType.ALL)
	private Customer customer;
	@OneToOne(cascade=CascadeType.ALL)
	private Car car;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Payment getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(Payment paymentType) {
		this.paymentType = paymentType;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	@Override
	public String toString() {
		return "CheckOut [id=" + id + ", paymentType=" + paymentType + ", customer=" + customer + ", car=" + car + "]";
	}

}
