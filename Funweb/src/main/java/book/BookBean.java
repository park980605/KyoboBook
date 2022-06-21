package book;

import java.sql.*;

public class BookBean {
	private int num;
	private String subject;
	private String name;
	private String publisher;
	private String content;
	private int price;
	private String kind;
	private String image;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "BookBean [num=" + num + ", subject=" + subject + ", name=" + name + ", publisher=" + publisher
				+ ", content=" + content + ", price=" + price + ", kind=" + kind + ", image=" + image + "]";
	}

}
