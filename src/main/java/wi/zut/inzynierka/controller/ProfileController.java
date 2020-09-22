package wi.zut.inzynierka.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Property;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.service.OfferService;
import wi.zut.inzynierka.service.PropertyService;
import wi.zut.inzynierka.service.RegionService;
import wi.zut.inzynierka.service.UserService;

@Controller
public class ProfileController {
	@Autowired
	private UserService userService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private OfferService offerService;
	
	@GetMapping("/profile")
	public String showUserProfile(Model theModel) {
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		wi.zut.inzynierka.entity.User Theuser = userService.findByUserName(name);
		List<Offer> theOffers = offerService.findAllByUser(Theuser);
		theModel.addAttribute("offer", theOffers);
		return "profile";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate (@RequestParam("offerId") int theId, Model theModel) {
		Offer theOffer = offerService.findById(theId);
		Integer theRegionId = theOffer.getRegion().getId();
		Integer thePropertyId = theOffer.getProperty().getId();
		
		List<Region> regions = regionService.findAll();
		
		List<Property> properties = propertyService.findAll();
		theModel.addAttribute("theregionid", theRegionId);
		theModel.addAttribute("thepropertyid", thePropertyId);
		theModel.addAttribute("properties",properties);
		theModel.addAttribute("regions", regions);
		theModel.addAttribute("offer",theOffer);
		return "add-offer";
	}
	
	@GetMapping("/delete")
	public String deleteOffer(@RequestParam("offerId") int theId) {
		offerService.deleteById(theId);
		return "redirect:/profile";
	}
}