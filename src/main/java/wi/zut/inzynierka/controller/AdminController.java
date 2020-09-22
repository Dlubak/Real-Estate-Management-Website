package wi.zut.inzynierka.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import wi.zut.inzynierka.entity.Offer;
import wi.zut.inzynierka.entity.Property;
import wi.zut.inzynierka.entity.Region;
import wi.zut.inzynierka.entity.User;
import wi.zut.inzynierka.service.OfferService;
import wi.zut.inzynierka.service.PropertyService;
import wi.zut.inzynierka.service.RegionService;
import wi.zut.inzynierka.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private OfferService offerService;
	@Autowired
	private RegionService regionService;
	@Autowired
	private PropertyService propertyService;
	
	@GetMapping("/admin")
	public String adminPage(Model theModel) {
		List<User> userList = getAllUsers();
		theModel.addAttribute("userList", userList);
		return "admin"; 
	}
	
	@GetMapping("/admin/edit/{id}")
	public String getUserToEdit(@PathVariable("id")int id, Model theModel) {
		User user = new User();
		user = userService.findById(id);
		Map<Integer,String> roleMap = new HashMap<Integer,String>();
		roleMap = prepareRoleMap();
		int roleNumber = user.getRoles().iterator().next().getId();
		user.setRoleNumber(roleNumber);
		theModel.addAttribute("roleMap",roleMap);
		theModel.addAttribute("user",user);
		return "edit-user";
	}
	
	@PostMapping("/admin/edit/updateuser/{id}")
	public String updateUser(@PathVariable("id") int id, User user) { 
		int roleNumber = user.getRoleNumber();
		userService.updateUser(id, roleNumber);
		return "redirect:/admin";
	}
	@GetMapping("/admin/offers/{id}")
	public String manageUserOffers(@PathVariable("id") int theId, Model theModel) {
		User user = new User();
		user = userService.findById(theId);
		List<Offer> theOffers = offerService.findAllByUser(user);
		theModel.addAttribute("offer", theOffers);
		return "manage-offers";
	}
	
	@GetMapping("/admin/offer/delete/{offerId}")
	public String deleteAdminOffer(@PathVariable("offerId") int theId) {
		offerService.deleteById(theId);
		return "redirect:/admin/";
	}
	
	@GetMapping("/admin/offer/update/{offerId}")
	public String showAdminUpdateForm (@PathVariable("offerId") int theId, Model theModel) {
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
	@PostMapping("/admin/offer/update/{offerId}/saveOffer")
	public String saveOffer(@ModelAttribute("offer") Offer theOffer) {
		offerService.saveOffer(theOffer);
		return "redirect:/admin";
	}
	
	private Map<Integer, String> prepareRoleMap() {
		Map<Integer, String> roleMap = new HashMap<Integer, String>();
		roleMap.put(1, "admin");
		roleMap.put(2, "user");
		return roleMap;
	}

	private List<User> getAllUsers() {
		List<User> usersList = userService.findAll();
		for(User users : usersList) {
			int roleNumber = users.getRoles().iterator().next().getId();		
			users.setRoleNumber(roleNumber);
		}
		return usersList;
	}
}
