package ie.dit.maximilian.mihoc;

import java.util.List;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

public class MyItemAdapter extends ArrayAdapter<ItemInterface>
{
	List<ItemInterface> list;
	Context context;
	int pos;
	Item item;
	SectionItem sectionItem;
	LayoutInflater inflater;
	EditText qty;
	
	public MyItemAdapter(Context context, List<ItemInterface> items) 
	{
		super(context, 0, items);
		this.context = context;
		this.list = items;
		
	}
	
	@SuppressLint("NewApi")
	@Override
    public View getView(int position, View convertView, ViewGroup parent)
	{	
		//Reference: The idea about how to group elements with sections is from http://bartinger.at/listview-with-sectionsseparators/
		//Reference complete
		View row = convertView;
		ItemInterface it = list.get(position);
		inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		if(it != null)
		{
			if(!it.isSection())
			{
				item = (Item) it;
				
				row = inflater.inflate(R.layout.row, parent, false);
				
				
				TextView itemName = (TextView)row.findViewById(R.id.itemName);
				itemName.setText(item.getName());
				
				TextView itemPrice = (TextView)row.findViewById(R.id.itemPrice);
				itemPrice.setText("€" + item.getPrice());
				
				ImageView icon = (ImageView)row.findViewById(R.id.icon);
				icon.setImageResource(item.getImageSrc());
				//icon.setImageDrawable(item.getImage());
				
				TextView itemDesc = (TextView)row.findViewById(R.id.itemDescription);
				itemDesc.setText(item.getDescription());
				
				TextView viewQty = (TextView)row.findViewById(R.id.viewQty);
				viewQty.setText("Qty: " + item.getQuantity());
				
				qty = (EditText)row.findViewById(R.id.qty);
				qty.addTextChangedListener(new MyTextWatcher(row));
				qty.setTag(item);
				
			}
			else
			{
				sectionItem = (SectionItem) it;
				row = inflater.inflate(R.layout.header, parent, false);
				TextView section = (TextView)row.findViewById(R.id.list_header_title);
				section.setText(sectionItem.getSectionName());
			}
		}
		return row;
	}
}
