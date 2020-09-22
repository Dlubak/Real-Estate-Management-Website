package wi.zut.inzynierka.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.User;
@Repository
public interface OfferRepository extends JpaRepository<Offer, Integer> {
	List<Offer> findAll();
	Offer findById(int theId);
	Offer deleteById(int theId);
	List<Offer> findAllByUser(User user);
	List<Offer> findAllByOrderByDateAddDesc();
	List<Offer> findByTitle(String theSearchTitle);
	List<Offer> findAllByOrderByPriceDesc();
	List<Offer> findAllByOrderByPriceAsc();
}
