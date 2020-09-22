package wi.zut.inzynierka.service;

import java.util.List;

import wi.zut.inzynierka.entity.Region;

public interface RegionService {
	List<Region> findAll();
	Region findById(int theId);
}
