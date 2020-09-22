package wi.zut.inzynierka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wi.zut.inzynierka.entity.Property;

@Repository
public interface PropertyRepository extends JpaRepository<Property, Integer> {
	List<Property> findAll();
}
