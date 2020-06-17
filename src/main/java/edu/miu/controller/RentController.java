package edu.miu.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.miu.domain.Car;
import edu.miu.domain.Customer;
import edu.miu.domain.Rent;
import edu.miu.domain.Response;
import edu.miu.exception.CarNotFoundException;
import edu.miu.exception.CustomerNotFoundException;
import edu.miu.service.CarService;
import edu.miu.service.CustomerService;
import edu.miu.service.RentService;
import edu.miu.utils.FactoryMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
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
import java.util.HashMap;
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

        Customer customer = customerService.findCustomer(customerId);

        Rent rent = new Rent();
        rent.setCar(car);
        rent.setCustomer(customer);
        rent.setCheckoutDate(LocalDate.now());

        model.addAttribute("rent", rent);
        model.addAttribute("action", "add");
        System.out.println("1: " + rent);
        return "rent-car";
    }

    @RequestMapping(value = "/return", method = RequestMethod.GET)
    public String returnCarForm(@RequestParam("rent_id") Long rentId, Model model) {
        System.out.println("rent/return " + rentId);
        Rent rent = rentService.getById(rentId);
        rent.setReturnDate(LocalDate.now());

        model.addAttribute("rent", rent);
        model.addAttribute("action", "return");

        System.out.println(rent);
        return "rent-car";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String rentCar(@RequestBody MultiValueMap<String, String> formData) {
        List<String> customerIds = formData.get("customer_id");
        List<String> carIds = formData.get("car_id");
        List<String> dueDates = formData.get("dueDate");

        if (customerIds == null || customerIds.size() == 0)
            throw new CustomerNotFoundException(null, null);

        Customer customer = customerService.findCustomer(Long.valueOf(customerIds.get(0)));
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
        rent.setCar(car);
        rent.setCustomer(customer);
        rent.setCheckoutDate(checkoutDate);
        rent.setDueDate(dueDate);
        rent.setRentCost(days * car.getPricePerDay());

        System.out.println(car);
        System.out.println(customer);
        carService.changeCarStatusById(car.getId(), "not available");
        rentService.create(rent);

        return "redirect:/cars?page=0&limit=10";
    }

    ObjectMapper mapper = new ObjectMapper();

    @RequestMapping(value = "/return/{rent_id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Response returnCar(@PathVariable("rent_id") Long rentId, HttpEntity<String> httpEntity) {
        HashMap<String, String> body = FactoryMethods.jsonToMap(httpEntity.getBody());

        Rent rent = rentService.getById(rentId);
        Double overdueCost = Double.valueOf(body.get("overdueCost"));
        LocalDate returnDate = LocalDate.parse(body.get("returnDate"));

        System.out.println(rent);
        System.out.println(overdueCost + " " + returnDate);
        Response response = new Response("success", "");

        int days = FactoryMethods.daysBetweenTwoDate(rent.getDueDate(), returnDate);
        if (days * rent.getCar().getOverduePerDay() != overdueCost) {
            response.setMessage("Wrong overdue cost");
            response.setStatus("failed");
        } else {
            rent.setFeeForOverdue(overdueCost);
            rent.setTotalCost(rent.getFeeForOverdue() + rent.getRentCost());
            rent.setReturnDate(returnDate);
            carService.changeCarStatusById(rent.getCar().getId(), "available");
            rentService.update(rent);
        }

        return response;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String rents(@RequestParam int page, @RequestParam int limit, Model model) {
        Page<Rent> rents = rentService.getRents(page, limit);

        int total = rents.getTotalPages();

        model.addAttribute("rents", rents.getContent());
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", total);

        return "rents-list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public @ResponseBody Page<Rent> rentsList(@RequestParam int page, @RequestParam int limit) {
        Page<Rent> rents = rentService.getRents(page, limit);

        return rents;
    }
}

