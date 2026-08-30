using System;
using System.IO;

class Graph 
{
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
	}
	
	class Node
	{
		public int vert;
		public int wgt;
		public Node next;
	}
    
	private int V;
	private int E;
	private Node[] adj;
    
	
    private Node z;
    
    // used for traversing graph
    private int[] visited;
    private int id;
 
    // default constructor, some code missing
    public Graph(string graphFile)  
    {
        int u, v;
        int e, wgt;
        Node t;

        StreamReader reader = new StreamReader(graphFile);
	   
	    char[] splits = new char[] { ' ', ',', '\t'};     
        string line = reader.ReadLine();
        string[] parts = line.Split(splits, StringSplitOptions.RemoveEmptyEntries);
        
        // find out number of vertices and edges
        V = int.Parse(parts[0]);
        E = int.Parse(parts[1]);

        // create sentinel node
        z = new Node(); 
        z.next = z;
		
		adj = new Node[V+1];
        for(v = 1; v <= V; ++v)
        {  
			adj[v] = z;
		}
        
        // read the edges
		Console.WriteLine("Reading edges from text file");
	    for(e = 1; e <= E; ++e)
	    {
            line = reader.ReadLine();
            parts = line.Split(splits, StringSplitOptions.RemoveEmptyEntries);
            u = int.Parse(parts[0]);
            v = int.Parse(parts[1]); 
            wgt = int.Parse(parts[2]);
            
            Console.WriteLine("Edge {0}--({1})--{2}", toChar(u), wgt, toChar(v));    
            // write code to put edge into adjacency lists     
            t = new Node();
			t.vert = v;
			t.wgt = wgt;
			t.next = adj[u];
			adj[u] = t;
			
			t = new Node();
			t.vert = u;
			t.wgt = wgt;
			t.next = adj[v];
			adj[v] = t;
	    }	       
    }
   
   public void DF( int s) 
    {
        id = 0;
        visited = new int[V+1];
        int u,v;
		Node t;
		
		for(v = 1; v <= V; v++)
			visited[v] = 0;
			
		Stack stack = new Stack();
		stack.push(s);
		
		while(!stack.isEmpty())
		{
			v = stack.pop();
			if(visited[v] == 0)
			{
				visited[v] = ++id;
				Console.WriteLine("Visiting Node {0} ", toChar(v));
				for(t = adj[v]; t != t.next; t = t.next)
				{
					u = t.vert;
					if(visited[u] == 0)
						stack.push(u);
				}
			}
		}
    }
   
    // convert vertex into char for pretty printing
    private char toChar(int u)
    {  
        return (char)(u + 64);
    }
    
    // method to display the graph representation
    public void display() {
        int v;
        Node n;
        
        for(v=1; v<=V; ++v){
            Console.Write("\nadj[{0}] ->", toChar(v));
            for(n = adj[v]; n != z; n = n.next) 
                Console.Write(" |{0} | {1}| ->", toChar(n.vert), n.wgt);
            Console.WriteLine(" z");
        }            
    }

    public static void Main()
    {
        int s = 1;
        string fname = "wGraph3.txt";               

        Graph g = new Graph(fname);
       
        g.display();
        
        g.DF(s);
    }

}