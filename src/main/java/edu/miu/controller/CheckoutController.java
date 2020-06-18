package edu.miu.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.miu.domain.*;
import edu.miu.exception.CarNotFoundException;
import edu.miu.exception.CustomerNotFoundException;
import edu.miu.service.CarService;
import edu.miu.service.CustomerService;
import edu.miu.service.CheckoutService;
import edu.miu.utils.FactoryMethods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/checkouts")
@SessionAttributes("checkout-process")
public class CheckoutController {
    @Autowired
    private CarService carService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CheckoutService checkoutService;

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
//    @RequestMapping(value = "/add", method = RequestMethod.GET)
//    public String checkoutForm(@RequestParam("car_id") Long carId, @RequestParam("customer_id") Long customerId, Model model) {
    public String checkoutForm(Model model) {
//        Car car = carService.getCarById(carId);
//
//        Customer customer = customerService.findCustomer(customerId);
//
//        Checkout checkout = new Checkout();
//        checkout.setCar(car);
//        checkout.setCustomer(customer);
//        checkout.setCheckoutDate(LocalDate.now());
//
//        model.addAttribute("checkout", checkout);
        model.addAttribute("action", "add");
        Checkout checkout = (Checkout) (((ModelMap) model).get("checkout-process"));
        checkout.setCheckoutDate(LocalDate.now());
        model.addAttribute("checkout", checkout);

        return "checkout";
    }

    @RequestMapping(value = "/return", method = RequestMethod.GET)
    public String returnCarForm(@RequestParam("checkout_id") Long checkoutId, Model model) {
        System.out.println("checkout/return " + checkoutId);
        Checkout checkout = checkoutService.getById(checkoutId);
        checkout.setReturnDate(LocalDate.now());

        model.addAttribute("checkout", checkout);
        model.addAttribute("action", "return");

        System.out.println(checkout);
        return "checkout";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String checkout(@RequestBody MultiValueMap<String, String> formData, Model model) {
//        List<String> customerIds = formData.get("customer_id");
//        List<String> carIds = formData.get("car_id");
        List<String> dueDates = formData.get("dueDate");

//        if (customerIds == null || customerIds.size() == 0)
//            throw new CustomerNotFoundException(null, null);
//
//        Customer customer = customerService.findCustomer(Long.valueOf(customerIds.get(0)));
//        if (customer == null)
//            throw new CustomerNotFoundException(Long.valueOf(customerIds.get(0)), null);
//
//        if (carIds == null || carIds.size() == 0)
//            throw new CarNotFoundException(null, null);

//        Car car = carService.getCarById(Long.valueOf(carIds.get(0)));
//        if (car == null)
//            throw new CarNotFoundException(Long.valueOf(carIds.get(0)), null);


        LocalDate checkoutDate = LocalDate.now();
        LocalDate dueDate = LocalDate.parse(dueDates.get(0));
        int days = FactoryMethods.daysBetweenTwoDate(checkoutDate, dueDate);

        Checkout checkout = (Checkout) (((ModelMap) model).get("checkout-process"));
//        Checkout checkout = new Checkout();
        Car car = checkout.getCar();
        Customer customer = checkout.getCustomer();

        checkout.setCar(car);
        checkout.setCustomer(customer);
        checkout.setCheckoutDate(checkoutDate);
        checkout.setDueDate(dueDate);
        checkout.setRentCost(days * car.getPricePerDay());

        carService.changeCarStatusById(car.getId(), "not available");
        checkoutService.create(checkout);

        return "redirect:/cars?page=0&limit=10";
    }

    ObjectMapper mapper = new ObjectMapper();

    @RequestMapping(value = "/return/{checkout_id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Response returnCar(@PathVariable("checkout_id") Long checkoutId, HttpEntity<String> httpEntity) {
        HashMap<String, String> body = FactoryMethods.jsonToMap(httpEntity.getBody());

        Checkout checkout = checkoutService.getById(checkoutId);
        Double overdueCost = Double.valueOf(body.get("overdueCost"));
        LocalDate returnDate = LocalDate.parse(body.get("returnDate"));

        System.out.println(checkout);
        System.out.println(overdueCost + " " + returnDate);
        Response response = new Response("success", "");

        int days = FactoryMethods.daysBetweenTwoDate(checkout.getDueDate(), returnDate);
        if (days * checkout.getCar().getOverduePerDay() != overdueCost) {
            response.setMessage("Wrong overdue cost");
            response.setStatus("failed");
        } else {
            checkout.setFeeForOverdue(overdueCost);
            checkout.setTotalCost(checkout.getFeeForOverdue() + checkout.getRentCost());
            checkout.setReturnDate(returnDate);
            carService.changeCarStatusById(checkout.getCar().getId(), "available");
            checkoutService.update(checkout);
        }

        return response;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String checkouts(@RequestParam int page, @RequestParam int limit, Model model) {
        Page<Checkout> checkouts = checkoutService.getCheckouts(page, limit);

        int total = checkouts.getTotalPages();

        model.addAttribute("checkouts", checkouts.getContent());
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", total);

        return "checkouts-list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public @ResponseBody Page<Checkout> checkoutsList(@RequestParam int page, @RequestParam int limit) {
        Page<Checkout> checkouts = checkoutService.getCheckouts(page, limit);

        return checkouts;
    }

    @RequestMapping(value = "/customer", method = RequestMethod.GET)
    public String checkout(@RequestParam("id") Long carId, @ModelAttribute("newCustomer") Customer customer) {
        return "checkout";
    }

    @RequestMapping(value = "/customer", method = RequestMethod.POST)
    public String createCustomer(@ModelAttribute("newCustomer") Customer customer) {
        System.out.println("Here: " + customer.getId());
//        Customer newCustomer = customerService.saveCustomer(customer);

        return "checkout";
    }

    @RequestMapping(value = "/find", method = RequestMethod.GET)
    @ResponseBody
    public Customer findCustomer(@RequestParam("passportId") String passportId, Model model ) {
        Checkout checkout = (Checkout) (((ModelMap) model).get("checkout-process"));
        Customer customer = customerService.findCustomerbyPassportId(passportId);
        checkout.setCustomer(customer);
        model.addAttribute("checkout-process", checkout);
        if (customer == null) {
            return null;
        }
        return customer;
    }

    @RequestMapping(value = "/add-user", method = RequestMethod.POST)
    @ResponseBody
    public Customer addCustomerFromCheckOut(@Valid @RequestBody Customer newCustomer, Model model) {
        System.out.println("Start is Here");
        Checkout checkout = (Checkout) (((ModelMap) model).get("checkout-process"));
        System.out.println("Start is Here");
        System.out.println(newCustomer);
        Customer customer = customerService.saveCustomer(newCustomer);
        System.out.println("Start is Here");
        checkout.setCustomer(customer);
        System.out.println("Start is Here");
        model.addAttribute("checkout-process", checkout);
        System.out.println("Start is Here");
        return customer;
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String renderCheckOut(@RequestParam("carId") Long carId, Model model) {
        Car car = carService.getCarById(carId);
        Checkout checkout = new Checkout();
        checkout.setCar(car);
        model.addAttribute("checkout-process", checkout);
        return "searchUser";
    }
}

