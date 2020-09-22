package wi.zut.inzynierka.service;

import java.util.List;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.User;

public interface OfferService {
	List<Offer> findAll();
	Offer findById(int theId);
	Offer deleteById(int theId);
	void saveOffer(Offer theOffer);
	List<Offer> findAllByUser(User user);
	List<Offer> findAllByOrderByDateAddDesc();
	List<Offer> findByTitle(String theSearchTitle);
	List<Offer> findAllByOrderByPriceDesc();
	List<Offer> findAllByOrderByPriceAsc();
		
	
}
