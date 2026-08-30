// Simple weighted graph representation 
// Uses an Adjacency Linked Lists, suitable for sparse graphs
// Depth First Traversal Adjacency Linked List

using System;
using System.IO;

class Graph 
{
    // class for linked list nodes needed, do yourself
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
        
        // Create adjacency lists, initialised to sentinel node z
        // Dynamically allocate array 
        // adj = ????
		
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
        
		for( int v = 1; v <= V; v++)
			visited[v] = 0;
		dfVisit(0, s);
    }


    // DF for adjacency matrix
    private void dfVisit( int prev, int v)
    {
        int u;
		Node t = new Node();
        visited[v] = ++id;
		Console.WriteLine("Visited vertex {0} along edge {1} --- {2}", toChar(v), toChar(prev), toChar(v));
		
		
		for ( t = adj[v]; t != t.next; t = t.next)//for(u = 1; u <= V; u++)
		{
			u = t.vert;
			if(visited[u] == 0) 
				dfVisit(v,u);
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