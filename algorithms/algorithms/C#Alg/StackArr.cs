// Partial array implementation of Stack

using System;

class Stack {
	
	int top = 0;
	int[] a = new int[10];
	
	public void push(int x)
	{
		a[top++] = x;
	}
	
	public int pop()
	{
		top--;
		int x = a[top];
		return x;
	}
	
	public bool isEmpty()
	{
		return top == 0; 
	}
	
	public bool isMember(int x)
	{
		for(int i = 0; i < top; i++)
		{
			if(x == a[i])
				return true;
		}
		return false;
	}
	
	public void display()
	{
		for(int i = top -1; i >= 0; i--)
		{
			Console.Write(" {0}", a[i]);
		}
		Console.Write("\n");
	}
}

class StackTest
{

    public static void Main()
    {
        Stack s = new Stack();
        Console.Write("Stack is created\n");
        
        s.push(10); s.push(3); s.push(11); s.push(7);
        s.display();
        
        int i = s.pop();
        Console.Write("\nJust popped {0}\n", i);
        s.display();
		
		if (s.isMember(10))
		{ 
			Console.Write("\nIn Stack");
		}
		else 
		{
			Console.Write("\nNot In Stack");
		}
		
    }
}