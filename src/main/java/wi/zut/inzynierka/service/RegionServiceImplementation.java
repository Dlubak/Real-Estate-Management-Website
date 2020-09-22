package wi.zut.inzynierka.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.User;
import wi.zut.inzynierka.repository.OfferRepository;
import wi.zut.inzynierka.repository.RegionRepository;
@Service
public class RegionServiceImplementation implements RegionService {
	@Autowired
	RegionRepository regionRepository;

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Region> findAll() {
		return regionRepository.findAll();
	}

	@Override
	public Region findById(int theId) {
		return regionRepository.findById(theId);
	}

//	@Override
//	public List<Region> getAllRegions() {
//		return entityManager.createQuery("Select * FROM region order by name", Region.class).getResultList();
//				
//	}
	
	
}
