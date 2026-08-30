// Prim's MST Algorithm on Adjacency Lists representation 
// Uses an Adjacency Linked Lists, suitable for sparse graphs
// PrimSparse.cs

using System;
using System.IO;

// Heap code to be adapted for Prim's algorithm
// on adjacency lists graph
class Heap
{
    private int[] h;	   // heap array
    private int[] hPos;	   // hPos[h[k]] == k
    private int[] dist;    // dist[v] = priority of v

    private int N;         // heap size
	
    public Heap(int maxSize, int[] _dist, int[] _hPos) 
    {
        N = 0;
        h = new int[maxSize + 1];
        dist = _dist;
        hPos = _hPos;
    }


    public bool isEmpty() 
    {
        return N == 0;
    }

    
    public void siftUp( int k) 
    {
        int v = h[k];

        h[0] = 0;  // put dummy vertex before top of heap
        dist[0] = int.MinValue;
		
		while(dist[v] < dist[h[k/2]])
		{
			h[k] = h[k/2];
			hPos[h[k]] = k;
			k = k/2;
		}
		
		h[k] = v;
		hPos[v] = k;
    }


    public void siftDown( int k) 
    {
        int v, j;
        
		v = h[k];
		while(2*k <= N)
		{
			j = 2*k;
			if((j < N) && (dist[h[j+1]] < dist[h[j]]))
					++j;
			if (dist[v] <= dist[h[j]])
				break;
			
			h[k] = h[j];
			hPos[h[k]] = k;
			k = j;
		}
		h[k] = v; 
		hPos[v] = k;
    }

    public void insert( int x) 
    {
        h[++N] = x;
        siftUp(N);
    }


    public int remove() 
    {   
        int v = h[1];
        hPos[v] = 0; // v is no longer in heap
        h[N+1] = 0;  // put null node into empty spot
        
        h[1] = h[N--];
        siftDown(1);
        
        return v;
    }
	
	/*public int findElement(int vertex)
	{
		for (int i = 1; i <= N; i++)
		{
			if(h[i] == vertex) return i;
		}
		return 0;
	}*/
	
	/*Method to display the content of heap*/
	public void display() 
    {
        Console.WriteLine("{0}", h[1]);

        for(int i = 1; i <= N/2; i = i * 2) {
            for(int j = 2*i; j < 4*i && j <= N; ++j)
                Console.Write("{0}  ", h[j]);
            Console.Write("\n");
        }
    }
}  // end of Heap class


// Graph code to support Prim's MSt Alg
class Graph 
{      
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
    
    // default constructor
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

    // convert vertex into char for pretty printing
    private char toChar(int u)
	{  
        return (char)(u + 64);
    }

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

    // Prim's algorithm to compute MST
    // Code most of this yourself
	
    int[] MST_Prim( int s) 
    {
        int v, u;
        int wgt, wgt_sum = 0;
        int[]  dist, parent, hPos;
        Node t;
        
		dist = new int[V+1];
		parent = new int[V+1];
		hPos = new int[V+1];
		
		for (v=1; v < V+1; v++)
		{
			dist[v] = int.MaxValue;
			parent[v] = 0;
			hPos[v] = 0;
		}
		Heap pq = new Heap(V,dist,hPos);
		
        dist[s] = 0;
        pq.insert(s);
		
        while ( !pq.isEmpty())  
        {
            v = pq.remove();
			wgt_sum += dist[v];
            Console.Write("\nAdding to MST edge {0}--({1})--{2}", toChar(parent[v]), dist[v], toChar(v));
            dist[v] = 0; // dist[v] = 0; because vertex v is no more in the heap
			for(t = adj[v]; t != t.next; t = t.next)
			{
				u = t.vert;
				wgt = t.wgt;
				if (wgt < dist[u])
				{
					dist[u] = wgt;
					parent[u] = v;
					if(hPos[u] == 0) // if u is not on heap
					{	
						//Console.WriteLine("\nInserting vertex {0} in heap", toChar(u));
						pq.insert(u);
					}
					else 
					{
						//int position = pq.findElement(u);
						//Console.WriteLine("\nShift Up vertex {0} on hPos[] = {1} which has a distance of {2}", toChar(u), position, dist[u]);
						pq.siftUp(hPos[u]);
					}
				}
			}
        }
        Console.Write("\n\nWeight of MST = {0}\n",wgt_sum);
		
        return parent;
    }


    public void showMST(int[] mst)
    {
            Console.Write("\n\nMinimum Spanning tree parent array is:\n");
            for(int v = 1; v <= V; ++v)
                Console.Write("{0} -> {1}\n", toChar(v), toChar(mst[v]));
            Console.WriteLine("");
    }
 
 
    public static void Main()
    {
        int s = 1;
        int[] mst;
        string fname = "wGraph3.txt";               

        Graph g = new Graph(fname);
       
        g.display();
        
        mst = g.MST_Prim(s);
        
        g.showMST(mst);
    }

} // end of Graph class