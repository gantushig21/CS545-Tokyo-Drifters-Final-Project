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
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Date;

@Controller
@RequestMapping("/rent")
public class RentController {
    @Autowired
    private CarService carService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String rentCarForm(@RequestParam("car_id") Long carId, @RequestParam("customer_id") Long customerId, @ModelAttribute("rent") Rent rent) {
        Car car = carService.getCarById(carId);

        Customer customer = customerService.getById(customerId);

        rent.setCar(car);
        rent.setCustomer(customer);
        rent.setCheckoutDate(new Date());

        System.out.println("1: " + rent);
        return "rent-car";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String rentCar(@ModelAttribute("rent") Rent rent) {
        System.out.println("2: " + rent);

        return "redirect:/cars?page=1&limit=10";
    }
}

