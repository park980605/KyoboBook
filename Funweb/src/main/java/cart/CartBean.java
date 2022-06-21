package cart;

public class CartBean {
	private String id;
	private String subject;
	private int price;
	
	private int qty;
	
	private String image;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CartBean [id=" + id + ", subject=" + subject + ", price=" + price + ", qty=" + qty + ", image=" + image
				+ "]";
	}

	
	

}
