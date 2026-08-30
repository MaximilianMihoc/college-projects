package ie.dit.maximilian.mihoc;

import java.util.ArrayList;
import java.util.List;

import android.app.ListActivity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

public class SecondScreenActivity extends ListActivity
{
	List<ItemInterface> itemList = new ArrayList<ItemInterface>();
	Button next;
	ListView listView;
	TextView budgetView;
	MyItemAdapter adapter;
	float total;
	float budget;
	String custName;
	String budgetStr;
	String ageStr;
	String email;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.second);
		
		//get detailes from the other screen
		Bundle bundle = getIntent().getExtras();
		custName = bundle.getString("fullName");
		//ageStr = bundle.getString("age");
		budgetStr = bundle.getString("totalValue");
		email = bundle.getString("email");
		
		//parse age and budget in numbers
		//int age = Integer.parseInt(ageStr);
		budget = Float.parseFloat(budgetStr);
		
		this.getActionBar().setTitle("Welcome " + custName);
		
		listView = (ListView)findViewById(android.R.id.list);
		//listView.setOverScrollMode(ListView.OVER_SCROLL_NEVER);
		
		//populateItemList();
		Resources res = getResources();
		//Pizza Section
		String[] tempStringArray = res.getStringArray(R.array.pizza);
		itemList.add(new SectionItem("Pizza"));
		parseXMLArrayInList(tempStringArray);
		
		//Drinks Section
		String[] tempStringArray2 = res.getStringArray(R.array.drinks);
		itemList.add(new SectionItem("Drinks"));
		parseXMLArrayInList(tempStringArray2);
		
		//Alcoholic Drinks Section
		String[] tempStringArray3 = res.getStringArray(R.array.alcoholicDrinks);
		itemList.add(new SectionItem("Alcoholic Drinks"));
		parseXMLArrayInList(tempStringArray3);
		
		
		adapter = new MyItemAdapter(this, itemList);
		listView.setAdapter(adapter);
		
		budgetView = (TextView)findViewById(R.id.budget);
		budgetView.setText("Your Budget is: " + budget);
		
		next = (Button)findViewById(R.id.next);
		next.setOnClickListener(new View.OnClickListener() 
		{
			
			@Override
			public void onClick(View v) 
			{	
				ArrayList<Item> selectedItems = new ArrayList<Item>();
				
				for(int i = 0; i < itemList.size(); i++)
				{
					if(!itemList.get(i).isSection())
					{
						Item item = (Item) itemList.get(i);
						if(item.getQuantity() != 0)
						{
							selectedItems.add(item);
						}
					}
				}
				
				Intent intent = new Intent(SecondScreenActivity.this, CheckOut.class);
				total = 0;
				//calculate total price for the selected items
				for(Item item : selectedItems)
				{
					total += item.getPrice() * item.getQuantity();
				}
				
				if((total + (total * 0.21)) >= budget)
				{
					Toast.makeText(SecondScreenActivity.this, "You Don't have enough money for all items selected. " +
							"Please deselect some or increase the budget.", Toast.LENGTH_SHORT).show();
				}
				else
				{
					Bundle bundle = new Bundle();
					bundle.putSerializable("selectedItems", selectedItems);
					intent.putExtras(bundle);
					intent.putExtra("total", "" + total);
					intent.putExtra("custName", custName);
					intent.putExtra("email", email);
					
					startActivity(intent);
				}
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) 
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.second_screen, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
	protected void onListItemClick(ListView l, View v, int position, long id) 
	{
		/*if(!itemList.get(position).isSection())
		{
			if (!(((Item) itemList.get(position)).isColor())) 
			{
				((Item) itemList.get(position)).setColor(true);
		        v.setBackgroundColor(Color.DKGRAY);
		    } 
			else 
		    {
		    	((Item) itemList.get(position)).setColor(false);
		        v.setBackgroundColor(Color.TRANSPARENT);
		    }
		}*/
	}
	
	public Item setValuesFromArray(String[] fields)
	{
		Log.w("ShoppingListApp: " , " " + fields[0] + " " + fields[1] + " "+ fields[2] + " "+ fields[3]);
		
		Item tempItem = new Item(fields[0].trim(), Float.parseFloat(fields[1]), fields[2]);
		Log.w("Fieldb: " , fields[3]);
		String file = fields[3].trim();
		
		Context c = this;
		int res = getResources().getIdentifier(file, "drawable", c.getPackageName());
		tempItem.setImageSrc(res);
		
		return tempItem;
	}
	
	public void parseXMLArrayInList(String[] tempStringArray)
	{
		for(int i = 0; i < tempStringArray.length; i++)
		{
			//have to do an xml parsing here
			Item item = new Item();
			//Log.w("list: " , tempStringArray[i].toString());
			String line = tempStringArray[i].toString();
			
			int firstIndex = line.indexOf(" | ");
			int secondIndex = line.indexOf(" | ", firstIndex + 3);
			int thirdIndex = line.indexOf(" | ", secondIndex + 3);
			
			String s1 = line.substring(0, firstIndex);
			String s2 = line.substring(firstIndex + 3, secondIndex);
			String s3 = line.substring(secondIndex + 3, thirdIndex);
			String s4 = line.substring(thirdIndex + 3, line.length());
			
			String[] fields = new String[4];
			fields[0] = s1;
			fields[1] = s2;
			fields[2] = s3;
			fields[3] = s4;
			
			item = setValuesFromArray(fields);
			itemList.add(item);
		}
	}
}
