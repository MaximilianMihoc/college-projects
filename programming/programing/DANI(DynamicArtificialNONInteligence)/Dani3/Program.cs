using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Speech.Synthesis;

/*
 *    DANI (Dynamic Artificial Non-Inteligence)
 *    
 *    DANI keeps a list of every word it knows with a link to every word that follows each word in 
 *    the list along with the count. This can be thought of as a graph of words. Each sentence you enter, 
 *    DANI parses a list of words. The program then searches its word list for each of the words in the sentence 
 *    you typed and if a match is found, DANI adds a link to the word following the word you typed. If the link 
 *    already exists, then DANI updates the count for that link.
 *    
 *    The improvements I did to this program are:
 *    -> My program can Load and Save word list
 *    -> My program ca Pre-populate the word list with a book but I didn't actually populate it with a book because It will give me really 
 *       long answers and I don't want that, so I populate it with some sentences.
 *    -> My program is also using text-to-speech of speech to text so if the user want, My program can speak it's answer
 *    -> Recognition of questions on output. If the first word is "Why", "Do", etc., it can generally be presumed to be a
 *       question, and a question mark added to the line.
 *    -> To avoid possible output loops, I checked to ensure no path link appears twice in one output sentence. To do that I checked if a world already appears in Dani's answer
 *       and if it is already there, do not put it again. I know that sometimes I need some words to be repeated but this is the best way I could
 *       do this to avoid a repetition of a link.
 *    -> The best think I did to this program and I am proud is that it can choose a link that was mostly used. For this I did the followings:
 *       -Each word has a list of following words and a counter for each word. 
 *       -according to this, I did a total of Counts from that following list. and I calculate the percentage for each word  
 *       -I generate a random number between 0 and 100
 *       -And, as a final step, I checked if that random number is less than the procentage for the words in following words list. If the percentage
 *       is smaller that the random number, the program is adding to that percentage the next percentage for next word in following words list.
 *       It is doing that until the percentage it will be bigger or equal to that the random number and when this is happend I have the word I want.
 *    -> When my program picks a random word that is used to start a new sentence(reply) it will pick a random word from the last input text, check
 *       if that word is in memory so that it can build a good answer. If that word is not in memory, Dani will pick a random word from it's memory
 *       and it will give a random answer.
 * 
*/
namespace Dani3
{
    public class Program
    {
        static List<Word> words = new List<Word>(); //This is a list of Words in wich I stored all words with counters and following words
        static string filename = "book.txt"; 

        //This is a method To Load text in List
        static void LoadTextIntoList(string[] line)
        {
            Word w = null;
            bool IsInList;

            for (int i = 0; i < line.Length; i++)
            {
                IsInList = false;

                foreach (Word word2 in words)
                {
                    if (word2.word == line[i])
                    {
                        IsInList = true;
                        word2.count++;
                        bool IsInFollows = false;

                        //check if the word ends with a question mark and transform it in '.' 
                        if (i + 1 < line.Length && (line[i + 1].Substring(line[i + 1].Length - 1) == "?"))
                            line[i + 1] = line[i + 1].Substring(0, line[i + 1].Length - 1) + ".";

                        foreach (string fol in word2.FollowWords)
                        {
                            if (i + 1 < line.Length)
                                if (line[i + 1] == fol) IsInFollows = true;
                        }
 
                        //check if the word is already a following word here and add it if is not in
                        if (i + 1 < line.Length && !IsInFollows) word2.AddInList(line[i + 1]);
                    }
                }
                //if the word is not in words list, it will be added in the next instructions
                if (!IsInList)
                {
                    w = new Word();
                    words.Add(w);

                    if(line[i] != "")
                        if ((line[i].Substring(line[i].Length - 1) == "?"))
                            line[i] = line[i].Substring(0, line[i].Length - 1) + "."; 

                    w.word = line[i];
                    w.count++;
                    if (i + 1 < line.Length) w.AddInList(line[i + 1]);
                    
                }

            }
        }
        // This is the method in which DANI will elaborate a response to be displayed
        static void RelpyFromDani(string RandomWord, bool speak)
        {
            Console.Write("DANI: ");
            string sentence = "";
            //check if the first word of the response is a word that can be part of a question.
            bool IsQuestion = false;
            if (RandomWord == "What" || RandomWord == "Do" || RandomWord == "Which" || RandomWord == "Who" || RandomWord == "Why" || RandomWord == "How") IsQuestion = true;

            while (RandomWord != "")
            {
                int i;
                //to avoid a repetition of a link I check if the word is already in sentence and if it is not in the sentence put it or else not
                for (i = 0; i < words.Count; i++)
                {
                    if (words[i].word == RandomWord) 
                    { 
                        if(sentence.IndexOf(RandomWord) == -1)
                            sentence = sentence + RandomWord + " "; 
                        break; 
                    }
                }
                int len = 0;
                if(i < words.Count) len = words[i].FollowWords.Count;
                
                int r = -1;
                if (len > 0)  r = RandomNum(i);
                if (r != -1) RandomWord = words[i].FollowWords[r];
                else RandomWord = "";
  
            }
            //If the sentence is a possible question put a question mark at the end
            if (IsQuestion && sentence.LastIndexOf(".") != -1) sentence = sentence.Substring(0,sentence.Length - 2) + "?";
            else if (IsQuestion) sentence = sentence.Substring(0, sentence.Length - 1) + "?";
           // write the sentence that the program built as a answer to the screen.
            Console.WriteLine(sentence);
            if (speak) DaniSpeak(sentence);
           

        }
        // Method to pick a random word from following words. When the word will be chosed, there is a bigger chance for a world with a bigger counter to be chosed
        static int RandomNum(int i)
        {
            int TotalCount = 0;
            foreach (string fw in words[i].FollowWords)
            {
                foreach (Word word in words)
                {
                    if (word.word == fw) TotalCount += word.count;
                }
            }

            Random f = new Random();
            int r = f.Next(0,100);

            float percent = 0.0f;
            int pos = -1;
            
            foreach (string fw in words[i].FollowWords)
            {
                foreach (Word word in words)
                {
                    if (r >= percent && word.word == fw)
                    {
                        if (TotalCount > 0)
                        {
                            percent += ((float)word.count / TotalCount) * 100;
                            pos++;
                        }
                        if(r <= percent) return pos;
                    }
                }
            }
            return pos;
        }
        //A method to make Dani Speack his reply
        static void DaniSpeak(string sentence)
        {
            using (SpeechSynthesizer synth = new SpeechSynthesizer())
            {
                synth.Rate = 1;
                synth.Volume = 100;
                synth.Speak(sentence);
            }
        }

        static void Main(string[] args)
        {
            Console.WriteLine("********************DANI********************\n\n");
            Console.WriteLine("DANI(Dynamic Artificial Non-Inteligence) is what is known nowadays as a conversational agent, and it was inspired by the talking computers of science-fiction such a HAL, the Computer from Star Trek and Eddie from the Hitchhikers Guide to the Galaxy.");
            Console.WriteLine("\nDANI starts out with some knowledge of the English language. You type a sentence and DANI responds with a sentence. As you interact with DANI, it learns more and more words and can have a conversation with you. ");
            
            Console.WriteLine("\n\nDo you want DANI to save what you type in?(Y/N)");
            string save = Console.ReadLine();
            Console.WriteLine("\nDo you want Dani to speak his reply?(Y/N)");
            string danispeak = Console.ReadLine();

            //Put words in memory
            
            string[] textFromFile = File.ReadAllLines(filename);
            for (int i = 0; i < textFromFile.Length; i++)
            {
                string[] FileLine = textFromFile[i].Split(' ');
                LoadTextIntoList(FileLine);
            }
            

            while (true)
            {
                Console.Write("Me: ");
                string inputText = Console.ReadLine();
                if (inputText.ToLower() == "quit") break;
                
                //save input text into file. Save in a file everything that a user type in. The user can make a choise if he want or not to save everything
                if (save.ToLower() == "y") System.IO.File.AppendAllText(filename, " " + inputText);

                bool speak;
                if (danispeak.ToLower() == "y") speak = true;
                else speak = false;

                string[] inputWord = inputText.Split(' ');
         
                Random r = new Random();
                int x = (r.Next() % (inputWord.Length));
                bool IsFound = false;
                //check if the random world chosed is in memory
                foreach (Word word in words)
                {
                    if (word.word == inputWord[x])
                    {
                        IsFound = true;
                        break;
                    }
                }
                // If the random word is not in memory, The answer will be a random answer or if the word is in memory, the answer will start 
                // with this word and give us a better answer
                if (!IsFound)
                {
                    x = (r.Next() % (words.Count));
                    RelpyFromDani(words[x].word, speak);
                }
                else
                {   
                    RelpyFromDani(inputWord[x], speak);
                }

                LoadTextIntoList(inputWord);
               
                // If you want to see See what is in The list comment this out
                //foreach (Word wo in words)
                //{
                //    Console.Write(wo.word + "\t" +"("+ wo.count + ")");
                //    foreach (string st in wo.FollowWords)
                //    {
                //        Console.Write(" " + st);
                //    }
                //    Console.WriteLine();
                //}
            }
        }
    }
}
