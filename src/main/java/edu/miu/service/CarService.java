package edu.miu.service;

import edu.miu.domain.Car;

import java.util.List;

public interface CarService {
    public void create(Car car);
    public void update(Car car);
    public List<Car> getCars(int page, int limit);
    public void deleteById(Long carId);
    public Car getCarById(Long carId);
    public int count();
}
