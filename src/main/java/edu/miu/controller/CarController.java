package edu.miu.controller;

import edu.miu.domain.Car;
import edu.miu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cars")
public class CarController {
    @Autowired
    private CarService carService;

    @RequestMapping(value = {"/add"}, method = RequestMethod.GET)
    public String addCar(@ModelAttribute("newCar") Car car) {
        return "add-car";
    }

    @RequestMapping(value = {"/add"}, method = RequestMethod.POST)
    public String addCarProcess(@ModelAttribute("newCar") Car car) {
        carService.save(car);

        return "redirect:/cars";
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String cars(@RequestParam int page, @RequestParam int limit, Model model) {
        Page<Car> cars = carService.getCars(page, limit);
        int total = cars.getTotalPages();
        System.out.println(total);
        model.addAttribute("cars", cars.getContent());
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", total);
        System.out.println(carService.getCars(page, limit));
        return "cars-list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public @ResponseBody Page<Car> carsList(@RequestParam int page, @RequestParam int limit) {
        Page<Car> cars = carService.getCars(page, limit);

        return cars;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteCar(@PathVariable("id") Long carId) {
        return  "redirect:/cars";
    }
}
