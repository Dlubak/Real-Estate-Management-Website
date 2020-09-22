package wi.zut.inzynierka.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.Role;

@Repository
public interface RegionRepository extends JpaRepository<Region, Integer> {
	List<Region> findAll();
	Region findById(int theId);
}
