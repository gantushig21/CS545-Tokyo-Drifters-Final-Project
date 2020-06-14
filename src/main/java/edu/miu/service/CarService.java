package edu.miu.service;

import edu.miu.domain.Car;

import java.util.List;

public interface CarService {
    public void save(Car car);
    public List<Car> getCars(int page, int limit);
    public void deleteById(long carId);
    public int count();
}
