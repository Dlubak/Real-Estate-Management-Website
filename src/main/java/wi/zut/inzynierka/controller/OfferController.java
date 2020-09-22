package wi.zut.inzynierka.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Property;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.service.OfferService;
import wi.zut.inzynierka.service.PropertyService;
import wi.zut.inzynierka.service.RegionService;
import wi.zut.inzynierka.service.UserService;
import wi.zut.inzynierka.user.CrmUser;

@Controller
public class OfferController {
	@Autowired
	private OfferService offerService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/addOffer")
	public String showOfferForm(Model theModel) {
		Offer theOffer = new Offer();
		List<Region> regions = regionService.findAll();
		List<Property> properties = propertyService.findAll();
		theModel.addAttribute("offer", theOffer);
		theModel.addAttribute("properties",properties);
		theModel.addAttribute("regions", regions);
		return "add-offer";
	}
	@PostMapping("/saveOffer")
	public String saveOffer(@ModelAttribute("offer") @Valid Offer theOffer,BindingResult theBindingResult, Model theModel) {
		
		if(theBindingResult.hasErrors()){
			List<Region> regions = regionService.findAll();
			List<Property> properties = propertyService.findAll();
			theModel.addAttribute("properties",properties);
			theModel.addAttribute("regions", regions);
			return "add-offer";
	    }
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String name = user.getUsername();
		
		wi.zut.inzynierka.entity.User Theuser = userService.findByUserName(name);
		theOffer.setUser(Theuser);
		
		offerService.saveOffer(theOffer);	
		return "redirect:/";
	}
	
	// TODO:
	// Not sure if this works yet tho
	@GetMapping("/offer/{id}")
	public String offerDetails(Model theModel, @PathVariable("id") Integer theId) {
		Offer theOffer = offerService.findById(theId);
		theModel.addAttribute("offer", theOffer);
		//System.out.println(theOffer.getId());
		return "offer-details";
		
	}
	
}
