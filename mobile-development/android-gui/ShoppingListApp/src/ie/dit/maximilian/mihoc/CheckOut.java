package ie.dit.maximilian.mihoc;

import java.util.ArrayList;

import android.support.v7.app.ActionBarActivity;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

public class CheckOut extends ActionBarActivity 
{
	String custName;
	String totalStr;
	float total;
	String email;
	Button send;
	String textForEmail;
	
	@SuppressLint("CutPasteId")
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.third);
		
		Bundle bunObject = getIntent().getExtras();
		custName = bunObject.getString("custName");
		
		this.getActionBar().setTitle("Receipt for " + custName + ", Thank you");
		
		@SuppressWarnings("unchecked")
		ArrayList<Item> items = (ArrayList<Item>)bunObject.getSerializable("selectedItems");
		totalStr = bunObject.getString("total");
		total = Float.parseFloat(totalStr);
		email = bunObject.getString("email");
		
		//Reference: The following code is from http://stackoverflow.com/questions/6216547/android-dynamically-add-views-into-view
		LayoutInflater ly = (LayoutInflater)getApplicationContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		ViewGroup parent = (ViewGroup)findViewById(R.id.receiptView);
		View view = ly.inflate(R.layout.receiptrow, parent);
		//Reference complete
		
		TextView nameInReceipt = (TextView)view.findViewById(R.id.textLeft);
		TextView priceInReceipt = (TextView)view.findViewById(R.id.textRight);
		
		String names = "";
		String prices = "";
		textForEmail = "Hello " + custName + "\n" + "Here are your order detailes:\n";
		for(int i = 0; i < items.size(); i ++)
		{
			Item it = items.get(i);
			
			names += it.getName() + "\n";
			prices += it.getQuantity() + " x " + it.getPrice() + "\n";
			
			textForEmail += it.getName() + "\t\t\t" + it.getDescription() + "\t\t\t€" + it.getQuantity() + " x " + it.getPrice() + "\n";
		}
		
		names += "\n\nSubtotal";
		prices += "\n\n" + String.format("%.2f",(total));
		names += "\nTaxes\\VAT";
		prices += "\n" + String.format("%.2f", (total * 0.21));
		names += "\nTotal";
		prices += "\n" + String.format("%.2f",(total + (total * 0.21)));
		textForEmail += "\nSubtotal\t\t" + String.format("%.2f",(total)) + "\nTaxes\\VAT\t\t" + String.format("%.2f", (total * 0.21)) + "\nTotal\t\t" + String.format("%.2f",(total + (total * 0.21)));
		
		nameInReceipt.setText(names);
		priceInReceipt.setText(prices);
		
		send = (Button)findViewById(R.id.sendEmailButton);
		send.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) 
			{
				sendEmail();
				
			}
		});
		
		Button back = (Button)findViewById(R.id.backButtonReceipt);
		back.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				finish();
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) 
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.check_out, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) 
	{
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) 
		{
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
	
	protected void sendEmail() 
	{
		//Reference: The following code is from 
		//	http://www.tutorialspoint.com/android/android_sending_email.htm
	      Log.i("Send email", "");

	      String[] TO = {email};
	      //String[] CC = {"mcmohd@gmail.com"};
	      Intent emailIntent = new Intent(Intent.ACTION_SEND, Uri.fromParts("mailto","abc@gmail.com", null));
	      emailIntent.setData(Uri.parse("mailto:"));
	      emailIntent.setType("text/plain");


	      emailIntent.putExtra(Intent.EXTRA_EMAIL, TO);
	      //emailIntent.putExtra(Intent.EXTRA_CC, CC);
	      emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Shopping List");
	      emailIntent.putExtra(Intent.EXTRA_TEXT, textForEmail);

	      try {
	         startActivity(Intent.createChooser(emailIntent, "Send mail..."));
	         finish();
	         Log.i("Finished sending email...", "");
	      } catch (android.content.ActivityNotFoundException ex) {
	         Toast.makeText(CheckOut.this, "There is no email client installed.", Toast.LENGTH_SHORT).show();
	      } 
	     //Reference complete
		
	}
}
