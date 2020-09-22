package wi.zut.inzynierka.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.User;
import wi.zut.inzynierka.repository.OfferRepository;
@Service
public class OfferServiceImplementation implements OfferService {
	@Autowired
	OfferRepository offerRepository;

	@PersistenceContext
    private EntityManager entityManager;
 

	@Override
	public Offer findById(int theId) {
		return offerRepository.findById(theId);
		
	}

	@Override
	public Offer deleteById(int theId) {
		return offerRepository.deleteById(theId);
		
	}

	@Override
	public void saveOffer(Offer theOffer) {
		//theOffer.setDateAdd(date);
		offerRepository.save(theOffer);
		
	}
	

	@Override
	public List<Offer> findAll() {
		
		return offerRepository.findAll();
	}

	@Override
	public List<Offer> findAllByUser(User user) {
		return offerRepository.findAllByUser(user);
	}

	@Override
	public List<Offer> findAllByOrderByDateAddDesc() {
		return offerRepository.findAllByOrderByDateAddDesc();
	}

	@Override
	public List<Offer> findByTitle(String theSearchTitle) {
		Query query = null;
		if(theSearchTitle != null && theSearchTitle.trim().length() > 0) {
			query = entityManager.createQuery("from Offer where lower(title) like :theOffer", Offer.class);
			query.setParameter("theOffer", "%" + theSearchTitle.toLowerCase() + "%");
		}
		else
		{
			 query = entityManager.createQuery("from Offer",Offer.class);
		}
		List<Offer> offers = query.getResultList();
		
		return offers;
		
	}

	@Override
	public List<Offer> findAllByOrderByPriceDesc() {
		return offerRepository.findAllByOrderByPriceDesc();
	}

	@Override
	public List<Offer> findAllByOrderByPriceAsc() {
		return offerRepository.findAllByOrderByPriceAsc();
	}


//	@Override
//	public List<Region> getAllRegions() {
//		return entityManager.createQuery("Select * FROM region order by name", Region.class).getResultList();
//				
//	}
	
	
}
