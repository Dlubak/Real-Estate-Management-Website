package wi.zut.inzynierka.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Offer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String title;
	
	@Column(updatable=false)
	@CreationTimestamp
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateAdd;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String imageUrl1;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String imageUrl2;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "is required")
	private String imageUrl3;
	
	@NotNull(message = "is required")
	@Size(min = 1, message = "Min 20 characters")
	private String description;
	
	@NotNull(message = "Please provide a price")
	@Min(value = 1, message = "Price can't be negative")
	private Double price;
	
	@NotNull(message = "is required")
	@Min(value = 1, message = "Area can't be negative")
	private Double area;
	
	@JoinColumn(name = "region_id", referencedColumnName = "id")
	@ManyToOne
	private Region region;
	
	@ManyToOne
	@JoinColumn(name = "property_id", referencedColumnName = "id")
	private Property property;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", updatable=false)
	private User user;
	
	public Offer() {}

	public Offer(String title, Date dateAdd, String imageUrl1, String imageUrl2, String imageUrl3, String description,
			Double price, Region region, Property property, Double area, User user) {
		this.title = title;
		this.dateAdd = dateAdd;
		this.imageUrl1 = imageUrl1;
		this.imageUrl2 = imageUrl2;
		this.imageUrl3 = imageUrl3;
		this.description = description;
		this.price = price;
		this.region = region;
		this.property = property;
		this.area = area;
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(Date dateAdd) {
		this.dateAdd = dateAdd;
	}

	public String getImageUrl1() {
		return imageUrl1;
	}

	public void setImageUrl1(String imageUrl1) {
		this.imageUrl1 = imageUrl1;
	}

	public String getImageUrl2() {
		return imageUrl2;
	}

	public void setImageUrl2(String imageUrl2) {
		this.imageUrl2 = imageUrl2;
	}

	public String getImageUrl3() {
		return imageUrl3;
	}

	public void setImageUrl3(String imageUrl3) {
		this.imageUrl3 = imageUrl3;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public Double getArea() {
		return area;
	}

	public void setArea(Double area) {
		this.area = area;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
