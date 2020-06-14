package edu.miu.service.impl;

import edu.miu.domain.Car;
import edu.miu.repository.CarRepository;
import edu.miu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class CarServiceImpl implements CarService {
    @Autowired
    private CarRepository carRepository;

    @Override
    public void save(Car car) {
        car.setCreatedDate(LocalDateTime.now());
        car.setUpdatedDate(LocalDateTime.now());

        System.out.println(car);
        carRepository.save(car);
    }

    @Override
    public List<Car> getCars(int page, int limit) {
        return (List<Car>) carRepository.findAll();
    }

    @Override
    public void deleteById(long carId) {
        carRepository.deleteById(carId);
    }

    @Override
    public int count() {
        return (int) carRepository.count();
    }
}
