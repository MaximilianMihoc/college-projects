// Partial linked list implementation of Stack

using System;

class Stack<T> {
    
    class Node {
        public T data;
        public Node next;  
    }
    private Node top;
      
    public Stack()
    { 
        top = null;
    }
        
    public void push(T x) {
        Node t = new Node();
        t.data = x;
        t.next = top;
        top = t;
    }

    public T pop()
	{
		if (top != null)
		{
			Node t = top;
			top = t.next;
			return t.data;
		}
		return 0;
	}
	
	public bool isMember(T x)
	{
		while(top != null)
		{
			if(x == top.data)
			{
				return true;
			}
			top = top.next;
		}
		return false;
		
	}
	
	
    public bool isEmpty(){
        return top == null;
    }


    public void display() {
        Node t = top;
        Console.Write("\nStack contents are:  ");
    
        while (t != null) {
            Console.Write("{0} ", t.data);
            t = t.next;
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
        T var; 
        s.push(var); s.push(var); s.push(var); s.push(var);
        s.display();
        
        T i = s.pop();
        Console.Write("\nJust popped {0}", i);
        s.display();
		
		if (s.isMember(T))
		{ 
			Console.Write("\nIn List");
		}
		else 
		{
			Console.Write("\nNot In List");
		}
		
    }
}