package edu.miu.repository;

import edu.miu.domain.Car;




import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface CarRepository extends PagingAndSortingRepository<Car, Long> {
	@Override
	Page<Car> findAll(Pageable pageable);

}
