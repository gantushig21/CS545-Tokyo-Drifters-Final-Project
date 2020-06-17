package edu.miu.service;

import edu.miu.domain.Car;

import java.util.List;

import org.springframework.data.domain.Page;

public interface CarService {
    public Page<Car> getCars(int page, int limit);
    public void create(Car car);
    public void update(Car car);
    public void deleteById(Long carId);
    public Car getCarById(Long carId);
    public int count();
    public void changeCarStatusById(Long carId, String status);
}
