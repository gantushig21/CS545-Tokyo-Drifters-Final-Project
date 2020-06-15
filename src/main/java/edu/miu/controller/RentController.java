package edu.miu.controller;

import edu.miu.domain.Car;
import edu.miu.domain.Customer;
import edu.miu.domain.Rent;
import edu.miu.service.CarService;
import edu.miu.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.time.LocalDateTime;

@Controller
@RequestMapping("/rent")
public class RentController {
    @Autowired
    private CarService carService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String rentCar(@ModelAttribute("rent") Rent rent) {
        Car car = carService.getCarById(Long.valueOf(1));

        Customer customer = customerService.getById(Long.valueOf(8));
//        customerService.create(customer);

        rent.setCar(car);
        rent.setCustomer(customer);

        return "rent-car";
    }
}

