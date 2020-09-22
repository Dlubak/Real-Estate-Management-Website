package wi.zut.inzynierka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.service.OfferService;

	

@Controller
public class HomeController {
	@Autowired
	private OfferService offerService;
	
	@GetMapping("/")
	public String showHome(Model theModel) {
		List<Offer> theOffers = offerService.findAllByOrderByDateAddDesc();
		theModel.addAttribute("offer", theOffers);
		return "home";
	}
	
	@GetMapping("/search")
	public String searchOffer(@RequestParam("theSearchTitle") String theSearchTitle, Model theModel) {
		List<Offer> theOffers = offerService.findByTitle(theSearchTitle);
		theModel.addAttribute("offer", theOffers);
		return "home";
	}
	
	@GetMapping("/price")
	public String priceFilter(@RequestParam("filterType") String filterType, Model theModel) {
		if(filterType.equals("asc")) {
			List<Offer> theOffers = offerService.findAllByOrderByPriceAsc();
			theModel.addAttribute("offer", theOffers);
		} else if(filterType.equals("desc")){
			List<Offer> theOffers = offerService.findAllByOrderByPriceDesc();
			theModel.addAttribute("offer", theOffers);
		}
		return "home";
	}
}
