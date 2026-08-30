package ie.dit.maximilian.mihoc;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity 
{
	TextView title;
	TextView name;
	RadioGroup gender;
	Spinner jobTitle;
	EditText ageValue;
	EditText totalValue;
	EditText email;
	Button next;

	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		
		title = (TextView)findViewById(R.id.maintitle);
		title.setGravity(Gravity.CENTER);
		
		name = (TextView)findViewById(R.id.name);
		gender = (RadioGroup)findViewById(R.id.gender);
		
		jobTitle = (Spinner)findViewById(R.id.jobTytle);
		ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.job_titles, android.R.layout.simple_spinner_dropdown_item);
		adapter.setDropDownViewResource(android.R.layout.simple_dropdown_item_1line);
		jobTitle.setAdapter(adapter);
		
		ageValue = (EditText)findViewById(R.id.ageValue);
		ageValue.setGravity(Gravity.RIGHT);
		totalValue = (EditText)findViewById(R.id.totalValue);
		totalValue.setGravity(Gravity.RIGHT);
		
		email = (EditText)findViewById(R.id.emailId);
		
		next = (Button) findViewById(R.id.nextButton);
		next.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) 
			{	
				Intent intent = new Intent(MainActivity.this, SecondScreenActivity.class);
				
				if(name.getText().toString().trim().length() <= 0)
				{
					Toast.makeText(MainActivity.this, "Please enter your name, " +
							"This is a required field.", Toast.LENGTH_SHORT).show();
				}
				else if(ageValue.getText().toString().trim().length() <= 0)
				{
					Toast.makeText(MainActivity.this, "Please enter your age, " +
							"This is a required field.", Toast.LENGTH_SHORT).show();
				}
				else if(totalValue.getText().toString().trim().length() <= 0)
				{
					Toast.makeText(MainActivity.this, "Please enter the abount of money you want to spend, " +
							"This is a required field.", Toast.LENGTH_SHORT).show();
				}
				else if(email.getText().toString().trim().length() <= 0)
				{
					Toast.makeText(MainActivity.this, "Please enter your E-mail, " +
							"This is a required field.", Toast.LENGTH_SHORT).show();
				}
				else if(!(email.getText().toString()).contains("@"))
				{
					Toast.makeText(MainActivity.this, "Invalid E-mail, " +
							"Please enter a valid one.", Toast.LENGTH_SHORT).show();
				}
				else
				{
					intent.putExtra("fullName", name.getText().toString());
					intent.putExtra("age", ageValue.getText().toString());
					intent.putExtra("totalValue", totalValue.getText().toString());
					intent.putExtra("email", email.getText().toString());
					startActivity(intent);
				}
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) 
	{
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
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
}
