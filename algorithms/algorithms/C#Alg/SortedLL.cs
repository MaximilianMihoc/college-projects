// Sorted linked list with a sentinel node
using System;

class SortedLL
{
	class Node {
        public int data;
        public Node next;
    }
	
	private Node z;
    private Node head;
    
	private Node curr;
	private Node prev;
	
    
	public SortedLL() {
        z = new Node();
		curr = new Node();
		prev = new Node();
		z.data = int.MaxValue;
        z.next = z;
        head = z;
    }
    
    public void insert(int x)
    {
        Node temp;
		temp = new Node();
        temp.data = x;		
		
		if (isEmpty())
		{
			//Console.WriteLine("head = {0}\t {1}", head,head.next);
			temp.next = z;
			head = temp;
			//Console.WriteLine("head = {0} \t temp {1}", head, head.next);	
		}
		else
		{
			prev = head;
			curr = head.next;
		
			//Console.WriteLine("prev = {0}\t curr = {1} \t z = {2}",prev.data, curr.data, z.data);
			if( temp.data <= head.data )
			{
				temp.next = head;
				head = temp;
				//Console.WriteLine("head = {0}", head.data);
					
			}
			else
			{
				while(prev.data != curr.data || curr != z)
				{
					if (prev.data < temp.data && temp.data <= curr.data)
					{
						temp.next = curr;
						prev.next = temp;
						//Console.WriteLine("prev = {0}\t curr = {1} \t temp = {2}",prev.data, curr.data, temp.data);
					}
					
					curr = curr.next;
					prev = prev.next;
					
					//Console.WriteLine("prev = {0}\t curr = {1} \t temp = {2}",prev.data, curr.data, temp.data);
				}
			}
		}

    }    

    public void display()
    {
        Node t = head;
        Console.Write("\nHead -> ");
        while( t != z) {
            Console.Write("{0} -> ", t.data);
            t = t.next;
        }
        Console.Write("Z\n");
    }
	
	public bool isEmpty() {
        return head == head.next;
    }
    
    public static void Main()
    {
        SortedLL list = new SortedLL();
        list.display();
		 
        int i, x;
        Random r = new Random();
        
        for(i=0; i<10; ++i) {
            x = r.Next(20);
            list.insert(x);
            Console.Write("\nInserting {0}", x);
            list.display();            
        }
        Console.ReadKey();
    }
}