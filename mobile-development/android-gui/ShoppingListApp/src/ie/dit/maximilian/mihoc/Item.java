package ie.dit.maximilian.mihoc;

import java.io.Serializable;

public class Item implements Serializable, ItemInterface
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private float price;
	private boolean checked = false;
	private String description;
	private int imageSrc;
	private int quantity; //number in stock
	private boolean color;
	

	/*public Item(String name, float price, String desc, int imageSrc)
	{
		this.name = name;
		this.price = price;
		this.description = desc;
		this.imageSrc = imageSrc;
	}*/
	
	public Item(String name, float price, String desc)
	{
		this.name = name;
		this.price = price;
		this.description = desc;
		this.quantity = 0;
		this.checked = false;
		this.color = false;
	}

	public boolean isSection() {
		return false;
	}

	public boolean isColor() {
		return color;
	}

	public void setColor(boolean color) {
		this.color = color;
	}
	
	public Item()
	{
		
	}
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	public void setImageSrc(int src)
	{
		this.imageSrc = src;
	}
	
	public int getImageSrc()
	{
		return imageSrc;
	}
	
	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getName()
	{
		return name;
	}
	
	public void setPrice(float price)
	{
		this.price = price;
	}
	
	public float getPrice()
	{
		return price;
	}
	
	public void setDescription(String description)
	{
		this.description = description;
	}
	
	public String getDescription()
	{
		return description;
	}
	

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
