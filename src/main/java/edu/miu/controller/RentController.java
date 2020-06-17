package edu.miu.controller;

import edu.miu.domain.Car;
import edu.miu.domain.Customer;
import edu.miu.domain.Rent;
import edu.miu.exception.CarNotFoundException;
import edu.miu.exception.CustomerNotFoundException;
import edu.miu.service.CarService;
import edu.miu.service.CustomerService;
import edu.miu.service.RentService;
import edu.miu.utils.FactoryMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/rent")
public class RentController {
    @Autowired
    private CarService carService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private RentService rentService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String rentCarForm(@RequestParam("car_id") Long carId, @RequestParam("customer_id") Long customerId, Model model) {
        Car car = carService.getCarById(carId);

        Customer customer = customerService.getById(customerId);

        Rent rent = new Rent();
        rent.setCar(car);
        rent.setCustomer(customer);
        rent.setCheckoutDate(LocalDate.now());

        model.addAttribute("rent", rent);
        System.out.println("1: " + rent);
        return "rent-car";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String rentCar(@RequestBody MultiValueMap<String, String> formData) {
        List<String> customerIds = formData.get("customer_id");
        List<String> carIds = formData.get("car_id");
        List<String> dueDates = formData.get("dueDate");

        if (customerIds == null || customerIds.size() == 0)
            throw new CustomerNotFoundException(null, null);

        Customer customer = customerService.getById(Long.valueOf(customerIds.get(0)));
        if (customer == null)
            throw new CustomerNotFoundException(Long.valueOf(customerIds.get(0)), null);

        if (carIds == null || carIds.size() == 0)
            throw new CarNotFoundException(null, null);

        Car car = carService.getCarById(Long.valueOf(carIds.get(0)));
        if (car == null)
            throw new CarNotFoundException(Long.valueOf(carIds.get(0)), null);

        LocalDate checkoutDate = LocalDate.now();
        LocalDate dueDate = LocalDate.parse(dueDates.get(0));
        int days = FactoryMethods.daysBetweenTwoDate(checkoutDate, dueDate);

        Rent rent = new Rent();
//        rent.setCar(car);
        rent.setCustomer(customer);
        rent.setCheckoutDate(checkoutDate);
        rent.setDueDate(dueDate);
        rent.setRentCost(days * car.getPricePerDay());

        System.out.println(car);
        System.out.println(customer);
        rentService.create(rent);

        return "redirect:/cars?page=1&limit=10";
    }
}

