package edu.miu.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
public class Checkout {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @OneToOne
    @JoinColumn(name = "car_id")
    private Car car;

    @Column(nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate checkoutDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate dueDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate returnDate;

    @Column(nullable = false)
    private Double rentCost;

    private Double feeForOverdue;

    private Double totalCost;

    @OneToOne
    @JoinColumn(name = "user_id")
    private UserCredentials userCredentials;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public LocalDate getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(LocalDate checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public LocalDate getDueDate() {
        return dueDate;
    }

    public void setDueDate(LocalDate dueDate) {
        this.dueDate = dueDate;
    }

    public LocalDate getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(LocalDate returnDate) {
        this.returnDate = returnDate;
    }

    public Double getRentCost() {
        return rentCost;
    }

    public void setRentCost(Double rentCost) {
        this.rentCost = rentCost;
    }

    public Double getFeeForOverdue() {
        return feeForOverdue;
    }

    public void setFeeForOverdue(Double feeForOverdue) {
        this.feeForOverdue = feeForOverdue;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public UserCredentials getUserCredentials() {
        return userCredentials;
    }

    public void setUserCredentials(UserCredentials userCredentials) {
        this.userCredentials = userCredentials;
    }

    @Override
    public String toString() {
        return "Rent{" +
                "id=" + id +
                ", customer=" + customer +
                ", car=" + car +
                ", checkoutDate=" + checkoutDate +
                ", dueDate=" + dueDate +
                ", returnDate=" + returnDate +
                ", rentCost=" + rentCost +
                ", feeForOverdue=" + feeForOverdue +
                ", totalCost=" + totalCost +
                ", userCredentials=" + userCredentials +
                '}';
    }
}
