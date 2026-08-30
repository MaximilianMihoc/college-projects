using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Dani3
{
    public class Word
    {
        private string word1;

        public string word
        {
            get { return word1; }
            set { word1 = value; }
        }

        private int Count;

        public int count
        {
            get { return Count; }
            set { Count = value; }
        }

        public List<string> FollowWords = new List<string>();

        public Word()
        {
            word1 = "";
            Count = 0;
        }

        public void AddInList( string follow)
        {
            FollowWords.Add(follow);
        }
        
        
    }
}
