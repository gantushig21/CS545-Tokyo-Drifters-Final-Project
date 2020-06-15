package edu.miu.service;

import edu.miu.domain.Car;

import java.util.List;

import org.springframework.data.domain.Page;

public interface CarService {
    public void save(Car car);
    public Page<Car> getCars(int page, int limit);
    public void deleteById(long carId);
    public int count();
}
