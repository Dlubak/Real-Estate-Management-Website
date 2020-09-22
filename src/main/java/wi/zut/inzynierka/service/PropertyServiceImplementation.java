package wi.zut.inzynierka.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wi.zut.inzynierka.entity.Property;
import wi.zut.inzynierka.repository.PropertyRepository;
@Service
public class PropertyServiceImplementation implements PropertyService {
	@Autowired
	PropertyRepository propertyRepository;

	@PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<Property> findAll() {
		return propertyRepository.findAll();
	}

	

//	@Override
//	public List<Region> getAllRegions() {
//		return entityManager.createQuery("Select * FROM region order by name", Region.class).getResultList();
//				
//	}
	
	
}
