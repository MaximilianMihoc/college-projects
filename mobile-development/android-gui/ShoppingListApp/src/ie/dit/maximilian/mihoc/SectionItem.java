package ie.dit.maximilian.mihoc;

public class SectionItem implements ItemInterface
{
	private String sectionName;

	public SectionItem()
	{
		
	}
	
	public SectionItem(String sectionName) 
	{
		this.sectionName = sectionName;
	}

	public String getSectionName() 
	{
		return sectionName;
	}

	public void setSectionName(String sectionName) 
	{
		this.sectionName = sectionName;
	}

	@Override
	public boolean isSection() 
	{
		return true;
	}

}
