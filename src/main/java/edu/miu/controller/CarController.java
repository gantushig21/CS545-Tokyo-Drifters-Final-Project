package edu.miu.controller;

import edu.miu.domain.Car;
import edu.miu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
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
        List<Car> cars = carService.getCars(page, limit);

        int total = carService.count();

        model.addAttribute("cars", carService.getCars(page, limit));
        model.addAttribute("page", page);
        model.addAttribute("limit", limit);
        model.addAttribute("pages", (int) Math.ceil((double) total / limit));

        return "cars-list";
    }

    @RequestMapping(value = {"/list"}, method = RequestMethod.GET)
    public @ResponseBody List<Car> carsList(@RequestParam int page, @RequestParam int limit) {
        List<Car> cars = carService.getCars(page, limit);

        return cars;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteCar(@PathVariable("id") Long carId) {
        return  "redirect:/cars";
    }
}
